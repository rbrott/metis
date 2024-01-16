const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const gklib = b.addStaticLibrary(.{
        .name = "gk",
        .target = target,
        .optimize = optimize,
    });
    gklib.addIncludePath(.{
        .path="GKlib",
    });
    // just `find metis-5.1.0/GKlib -name "*.c"`
    gklib.addCSourceFiles(.{ 
        .files = &.{
            "GKlib/htable.c",
            "GKlib/itemsets.c",
            "GKlib/memory.c",
            "GKlib/gkregex.c",
            "GKlib/util.c",
            "GKlib/test/strings.c",
            "GKlib/test/gkgraph.c",
            "GKlib/test/fis.c",
            "GKlib/test/gksort.c",
            "GKlib/test/rw.c",
            "GKlib/omp.c",
            "GKlib/io.c",
            "GKlib/fkvkselect.c",
            "GKlib/sort.c",
            "GKlib/evaluate.c",
            "GKlib/pqueue.c",
            "GKlib/string.c",
            "GKlib/random.c",
            "GKlib/fs.c",
            "GKlib/pdb.c",
            "GKlib/csr.c",
            "GKlib/timers.c",
            "GKlib/error.c",
            "GKlib/seq.c",
            "GKlib/b64.c",
            "GKlib/mcore.c",
            "GKlib/conf/check_thread_storage.c",
            "GKlib/graph.c",
            "GKlib/blas.c",
            "GKlib/getopt.c",
            "GKlib/tokenizer.c",
            "GKlib/rw.c",
        }, 
        .flags = &.{},
    });

    const libmetis = b.addStaticLibrary(.{
        .name = "metis",
        .target = target,
        .optimize = optimize,
    });
    libmetis.addIncludePath(.{
        .path="include",
    });
    libmetis.addIncludePath(.{
        .path="libmetis",
    });
    libmetis.addIncludePath(.{
        .path="GKlib",
    });
    libmetis.addCSourceFiles(.{
        .files = &.{
            "libmetis/kwayrefine.c",
            "libmetis/mincover.c",
            "libmetis/bucketsort.c",
            "libmetis/parmetis.c",
            "libmetis/util.c",
            "libmetis/kmetis.c",
            "libmetis/meshpart.c",
            "libmetis/compress.c",
            "libmetis/gklib.c",
            "libmetis/auxapi.c",
            "libmetis/separator.c",
            "libmetis/frename.c",
            "libmetis/mcutil.c",
            "libmetis/ometis.c",
            "libmetis/wspace.c",
            "libmetis/sfm.c",
            "libmetis/debug.c",
            "libmetis/balance.c",
            "libmetis/pmetis.c",
            "libmetis/mmd.c",
            "libmetis/refine.c",
            "libmetis/contig.c",
            "libmetis/coarsen.c",
            "libmetis/kwayfm.c",
            "libmetis/stat.c",
            "libmetis/checkgraph.c",
            "libmetis/timing.c",
            "libmetis/fm.c",
            "libmetis/fortran.c",
            "libmetis/initpart.c",
            "libmetis/graph.c",
            "libmetis/srefine.c",
            "libmetis/mesh.c",
            "libmetis/options.c",
            "libmetis/minconn.c",
        }, 
        .flags = &.{}
    });
    libmetis.linkLibrary(gklib);

    b.installArtifact(libmetis);
}
