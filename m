Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXXN4SGAMGQEOT2UT4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA31457FF0
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 18:56:47 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id s18-20020ac25c52000000b004016bab6a12sf9004367lfp.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 09:56:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637431007; cv=pass;
        d=google.com; s=arc-20160816;
        b=klrLCtjR1nD/BYOyBD9Ib71tBCSmzVMVWe0geZFtuUr2NkP6alGFxe3BkP3hzxlfrU
         AeZdl/pVmmIvLWENoUoUDximegol7sGTPxyuCcfz2JkwKxzX3nA8KZuZDSYUx16YX6hJ
         EgApFF5lq+D53ACDka9BN2gzvCKeHBmma7G8B2pSyWDG0O/PT7zFrEZB4T/hZmwzmutC
         KwL9IcDhavR59syGwb1ZzV14Reqq+Tme0W9P4l3kRWTqby2O8kkN9hKEzud2FvRAqT+g
         fzQ17PmhKVxTU5va6sdGoMBzAhJdJm744u7rIloOefty7naM1bkGE6bmsSoSFZ3ihtmp
         4V+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=XSrOqa940tVkqZk+j2MzyjnQhK9b3tpI+fYJ8K4+UAE=;
        b=g2g4FgKp5y9oUZDR80zBWutLS1h/p6KfccISuXEI3GWXnGGVXaoe+xH0CVf1LibXta
         F0APpbrDGJhyQy7ebXxpArnqxcEMufH+hWIEMFAAQGB63+hTMpeyEdtFghWsO8O3yUc6
         0ahGF+osUk5Y/kQPVTGTpNRZu32Pdw9aPlByzwAGstzXDMBLK2SPCjWjJTqkZzYAK7WV
         LVxiIXYGfd9w5nxT8Kx3vCc7gdEUD/uR1VRtbJsIFnFca4cPwskEja8rSFF/EDAK4gQR
         wX5FBftzr09VOz0BFX4RwYVZy31QX4CgeLd7NHdhJE4kDIlFmh0H5mnEYIK8H4L9LRy+
         rvgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pEaLTQWu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XSrOqa940tVkqZk+j2MzyjnQhK9b3tpI+fYJ8K4+UAE=;
        b=lgX6Xdsw0l1bTZFhrrUgSvVMNqm6sDhEn3s7Il6QzkzG4ihaj+BBlwYrGhG7j17Xic
         B/e9sRE/xRt0hFKQJz3VYp/piMSTsMfYFq/bEm/uyh9kcN9sxgW62vSKe3YflLZRg1u1
         hi1V087pjR0o0uiWiHj3zI35YyycvX/HFjg3XYDzOpVzeGkGm53yLXKcRTfXOBd0ggkn
         tDzAmGqjjvb9R5IEVJuEOThmAAiruw6Jvz+manTq6BouG3bLptuzGmzZzqLqYhwrlQDj
         yVTBaGlWbLTxEBIklhgcE5Z0pWrP3hLegvLF5ow3VLy7apkos6qI41h9tTA6hjI3KyyE
         m/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XSrOqa940tVkqZk+j2MzyjnQhK9b3tpI+fYJ8K4+UAE=;
        b=ptlzCKvzJf1XmOd5z3OZblOnsMWKTaXtBZKgHEeIz59tquQKOZzP3tfqFLpqOIxyh3
         lRoWHSR4xl7qFZjseInN7WYcw+mU6cSk5sGQLSG/MTnhNL+0Vrg+1/G9w3C369ZyzJNd
         fNF6iFfkpYPTuoxFSZS4qhTq10f/WPAF56WzuQxy4NKkhfgKz+9G90ulwYTtl3tnbCQm
         vaTtsIDWigEcS92bmXTtxWyt9lvZsT51A2jYWQhzJ9DjzSa5fLNSdhsR9FQN59MOvuTf
         dDmvwI25SLuBLyuewAz2wT57bSkC3RzmZmuTR1zxrJRkg7/oOfDMYeDhRb0Pt8mMnrHK
         I5Sg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ZsbVO+giSYOMaNtklKVzQ/7YOSrQLFmDqoDjPCjF118hesL++
	lukCrRHDGCNa8Q9UUh5mvkk=
X-Google-Smtp-Source: ABdhPJya3bQ1RtD8U6RGEETMvz5BBI8lz0VCVzw1cIJEG2jeyVLWfctJM19PEW9TNNyV0+QYrpWBXA==
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr43228616lfk.148.1637431007115;
        Sat, 20 Nov 2021 09:56:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8611:: with SMTP id a17ls390631lji.1.gmail; Sat, 20 Nov
 2021 09:56:46 -0800 (PST)
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr34638727ljl.491.1637431006150;
        Sat, 20 Nov 2021 09:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637431006; cv=none;
        d=google.com; s=arc-20160816;
        b=KeXbcv5IeujZ5lA6oV6THSMapIvmWUIiqipS5WwsMzZuuVGsMgBqjmgUhpROs006VF
         0HEcKsyxU9RRNQVephf1Uvs+n8HXtn7LPixoWnHj7UOXnJb0ywkL0iQ2vshI6Ta7rnje
         MB05y7aY3Q/gYCprlCLBf0s/fdltP0Oe5/COHp5D3RpsQSPUjRaR2ySU4Ec0eKUBnZFD
         9JwHuIkK0Nq+VuQc/6WuGhe39H19VN5cECrOF5fvU93diTqDQrOii/+z8KEAVXAck1+C
         DCxby+7BbOleFCJPpmD30FGlL2mh5AE8qH1pvwnw0Qg/kAlwN+//wU9o7A01AsqsNWcr
         lH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Y1GiwmArOWV2lGm5Tm7d2dvSgiWddFn8rSTN1+apQfs=;
        b=mPKRYgU17XOrVedzna7xgfEfDuYODOWelyPnDJBij6uE9glYcW1G0fazHyHWIz9aGQ
         A1D/3YswZriqpMkwGW7EIW/kEEzxUeWGUWa3m4zTNCN1ih8ZnAXx1ZMNQvYgtbY+SkqW
         pKg9vqFm+e9dCp076Kuj2s26OZU5krHkxETx7JLy+t4grR6dYQy1JuLVK82Awsnbg0hb
         IM00UfaxDukxPMKQ36AULjR2WC1OarnGG/7bO82+qkYmXnOewuGDK/IMywPLVJrj1/Vk
         X2BtihM7FposPYaq6jjW/DgxJwnpmoBpqG1VrdfwvauRHp+1JzXVhNl2qeVeNH9BxIM+
         j5oQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pEaLTQWu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id t12si273851ljh.0.2021.11.20.09.56.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 09:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.84.132]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MDMv4-1mytwJ1FWo-00Ac6k for <jailhouse-dev@googlegroups.com>; Sat, 20 Nov
 2021 18:56:45 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/4] Update to kas 2.6.2
Date: Sat, 20 Nov 2021 18:56:33 +0100
Message-Id: <28b675f4baa945175db90bf35aa065de54a2f4aa.1637430993.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1637430993.git.jan.kiszka@web.de>
References: <cover.1637430993.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WSiilpAAl8f815kYBT4lhvUzRqTsmjGzH73AKy5DT299jCbpqSB
 vZl139ITSIb0EHKWInZavf1fb4fk7gFWogAvwKhsyDFNZyrRRrMwzRc6heFCWOzi9HodJq9
 lt30bZRooPoajUn6JEnmRKERjonUrqFA7v98lEatfj4Jt+J31j0zzkFo1zBc6AlCoEjmEIQ
 PieGZT2yymuk4bQ7Qwinw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qvWjewdIT4w=:6eIhTCUeFWK7tSgXn/eZjF
 ctyqZbbssxV4zs5/e9N73qOeV62xnnRhvFtt5oJVAlz9l27oXqKamO/tKQOWNb6SRvSfLGiQ/
 AN7NcGrgvtnbJG/BqlklF/NoKJawJjXik5+QYILbELT6OPALi+m/qeox7qWpmbXxwh35qqvhi
 l7+m51ucYwkNWVdYX6eyL/pYY7cp3kkBolMn2JKoqJei51z/qLbzWRQJbFCnx3ZqmM1PYK+TT
 cnaY5VwPa5Dqa1Mx4PbPJwVlBtUNs04gqYPPEOfJR9Fo2d7fpN4MD4JIQiCXJBTZuWMHWuDqZ
 IVcN9soR/CNhF0KpGXPMNnu+k2AJpqU01NqL4i8sipDqQpqbdvJqi5u+hNjNbHnw7kDkSbIMg
 H0wMmOuSoJNblYJyrlobvkOXadoc0AwT2b+XpGKIUYM+bC6MvgzGPdjTy9QSD5jzDZX0dtPFE
 Kl5fuDVZ1kL6xpx2aMbeNzP6QjMycKQg3l30lWv9IZxYTvSEQvO4emSi7o/TrNMgBX3JkGvHn
 VKLYxSAP/9pkT8JWDWHnACMPSxqLFrd0ndkgI6oNNxwpoAKCXNWeijM5sZ4l4QP8x3hhtg24l
 iLsE4zN0UKD/I66eOdkeMzC6WhzyyxzRErhsQkStgoO7nQWgpu5n/w5WbgjLe8bOrQ//ksL8f
 wOfXa/X52hvr3n0VFpgnGhqchbe5JeopXLGbkiFKtV4oq96BF6FdpFo4lX8CyWroonUybSBmn
 sABYqhjpmnC0cfovzNtDko1t6vPW0FG9CMrXDkxFvjVLr3DXhChCrj+p330Ag7okwQozXyIV2
 9aVV7KfZtTKgbm030p2HNdXoPuBY2UPTXQh3qQJlLIc6thIiP+6uNH/L6HWkNZUmMh6Zzegsu
 Svd8WkoE3/LufBe224p5tSuqMs2uAQGhvsaUcUQGV9TtddMyW0JptwdfCsEUUCnUWtr3bL5wT
 E8YCrfyEUIq2IJV47qqiRU/4QBsoO3uFdUUkHLUKYHbGRGh/p6ekE/Df9FmqjyjTtccKqxB8w
 ZAEGLD3Fv51Sn0rS8i5kKT+OpEDznrS0fPsyhhWqlbxF3admmeHhH802Kz96mvvHYAmT+fSTf
 1GbjnwWbeR/sA0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=pEaLTQWu;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

From: Jan Kiszka <jan.kiszka@siemens.com>

Will allow to add a kconfig menu.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitlab-ci.yml |   2 +-
 kas-container  | 134 +++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 109 insertions(+), 27 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1f4c80d..354fd1f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas-isar:2.4
+image: ghcr.io/siemens/kas/kas-isar:2.6.2

 variables:
   GIT_STRATEGY: clone
diff --git a/kas-container b/kas-container
index b149c1c..d0df47b 100755
--- a/kas-container
+++ b/kas-container
@@ -29,12 +29,18 @@ set -e

 usage()
 {
-	printf "%b" "Usage: $0 [OPTIONS] { build | shell } [KASOPTIONS] KASFILE\n"
+	printf "%b" "Usage: $0 [OPTIONS] { build | checkout | shell } [KASOPTIONS] [KASFILE]\n"
+	printf "%b" "       $0 [OPTIONS] for-all-repos [KASOPTIONS] [KASFILE] COMMAND\n"
 	printf "%b" "       $0 [OPTIONS] clean\n"
+	printf "%b" "       $0 [OPTIONS] menu [KCONFIG]\n"
 	printf "%b" "\nPositional arguments:\n"
 	printf "%b" "build\t\t\tCheck out repositories and build target.\n"
+	printf "%b" "checkout\t\tCheck out repositories but do not build.\n"
 	printf "%b" "shell\t\t\tRun a shell in the build environment.\n"
+	printf "%b" "for-all-repos\t\tRun specified command in each repository.\n"
 	printf "%b" "clean\t\t\tClean build artifacts, keep downloads.\n"
+	printf "%b" "menu\t\t\tProvide configuration menu and trigger " \
+		    "configured build.\n"
 	printf "%b" "\nOptional arguments:\n"
 	printf "%b" "--isar\t\t\tUse kas-isar container to build Isar image.\n"
 	printf "%b" "--with-loop-dev		Pass a loop device to the " \
@@ -46,12 +52,19 @@ usage()
 	printf "%b" "--docker-args\t\tSame as --runtime-args (deprecated).\n"
 	printf "%b" "-d\t\t\tPrint debug output.\n"
 	printf "%b" "-v\t\t\tSame as -d (deprecated).\n"
+	printf "%b" "--version\t\tprint program version.\n"
 	printf "%b" "--ssh-dir\t\tDirectory containing SSH configurations.\n"
 	printf "%b" "\t\t\tAvoid \$HOME/.ssh unless you fully trust the " \
 		    "container.\n"
 	printf "%b" "--aws-dir\t\tDirectory containing AWScli configuration.\n"
+	printf "%b" "--git-credential-store\tFile path to the git credential " \
+		    "store\n"
 	printf "%b" "--no-proxy-from-env\tDo not inherit proxy settings from " \
 		    "environment.\n"
+	printf "%b" "--repo-ro\t\tMount current repository read-only\n" \
+		    "\t\t\t(default for build command)\n"
+	printf "%b" "--repo-rw\t\tMount current repository writeable\n" \
+		    "\t\t\t(default for shell command)\n"
 	printf "%b" "\n"
 	printf "%b" "You can force the use of podman over docker using " \
 		    "KAS_CONTAINER_ENGINE=podman.\n"
@@ -75,7 +88,7 @@ enable_isar_mode() {
 	fi
 }

-KAS_IMAGE_VERSION_DEFAULT="2.4"
+KAS_IMAGE_VERSION_DEFAULT="2.6.2"
 KAS_CONTAINER_IMAGE_PATH_DEFAULT="ghcr.io/siemens/kas"
 KAS_CONTAINER_IMAGE_NAME_DEFAULT="kas"

@@ -83,14 +96,12 @@ set_container_image_var() {
 	KAS_IMAGE_VERSION="${KAS_IMAGE_VERSION:-${KAS_IMAGE_VERSION_DEFAULT}}"
 	KAS_CONTAINER_IMAGE_NAME="${KAS_CONTAINER_IMAGE_NAME:-${KAS_CONTAINER_IMAGE_NAME_DEFAULT}}"
 	KAS_CONTAINER_IMAGE_PATH="${KAS_CONTAINER_IMAGE_PATH:-${KAS_CONTAINER_IMAGE_PATH_DEFAULT}}"
-	KAS_CONTAINER_IMAGE="${KAS_CONTAINER_IMAGE_PATH}/${KAS_CONTAINER_IMAGE_NAME}:${KAS_IMAGE_VERSION}"
+	KAS_CONTAINER_IMAGE_DEFAULT="${KAS_CONTAINER_IMAGE_PATH}/${KAS_CONTAINER_IMAGE_NAME}:${KAS_IMAGE_VERSION}"
+	KAS_CONTAINER_IMAGE="${KAS_CONTAINER_IMAGE:-${KAS_CONTAINER_IMAGE_DEFAULT}}"
 }

-if [ -n "${KAS_WORK_DIR}" ]; then
-	KAS_WORK_DIR=$(readlink -f "${KAS_WORK_DIR}")
-else
-	KAS_WORK_DIR="$(pwd)"
-fi
+KAS_WORK_DIR=$(readlink -f "${KAS_WORK_DIR:-$(pwd)}")
+KAS_BUILD_DIR=$(readlink -f "${KAS_BUILD_DIR:-${KAS_WORK_DIR}/build}")

 KAS_CONTAINER_ENGINE="${KAS_CONTAINER_ENGINE:-${KAS_DOCKER_ENGINE}}"
 if [ -z "${KAS_CONTAINER_ENGINE}" ]; then
@@ -164,35 +175,58 @@ while [ $# -gt 0 ]; do
 		KAS_AWS_DIR="$2"
 		shift 2
 		;;
+	--git-credential-store)
+		[ $# -gt 2 ] || usage
+		KAS_GIT_CREDENTIAL_STORE="$2"
+		shift 2
+		;;
 	--no-proxy-from-env)
 		KAS_NO_PROXY_FROM_ENV=1
 		shift 1
 		;;
+	--repo-ro)
+		KAS_REPO_MOUNT_OPT="ro"
+		shift 1
+		;;
+	--repo-rw)
+		KAS_REPO_MOUNT_OPT="rw"
+		shift 1
+		;;
 	-v | -d)
 		KAS_VERBOSE=1
 		KAS_OPTIONS_DIRECT="${KAS_OPTIONS_DIRECT} -d"
 		shift 1
 		;;
+	--version)
+		echo "$(basename "$0") $KAS_IMAGE_VERSION_DEFAULT"
+		exit 0
+		;;
 	--*)
 		usage
 		;;
 	clean)
 		[ $# -eq 1 ] || usage
-		KAS_CLEAN_DIR=build/tmp
 		if [ -n "${KAS_ISAR_ARGS}" ]; then
 			set_container_image_var
 			# SC2086: Double quote to prevent globbing and word splitting.
 			# shellcheck disable=2086
-			trace ${KAS_CONTAINER_COMMAND} run -v "${KAS_WORK_DIR}":/work:rw \
-					 --workdir=/work --rm ${KAS_ISAR_ARGS} \
+			trace ${KAS_CONTAINER_COMMAND} run -v "${KAS_BUILD_DIR}":/build:rw \
+					 --workdir=/build --rm ${KAS_ISAR_ARGS} \
 					 ${KAS_CONTAINER_IMAGE} \
-					 sudo rm -rf ${KAS_CLEAN_DIR}
+					 sudo rm -rf tmp
 		else
-			trace rm -rf "${KAS_WORK_DIR}/${KAS_CLEAN_DIR}"
+			trace rm -rf "${KAS_BUILD_DIR}/tmp"
 		fi
 		exit 0
 		;;
-	build|shell)
+	shell)
+		KAS_REPO_MOUNT_OPT_DEFAULT="rw"
+		KAS_CMD=$1
+		shift 1
+		break
+		;;
+	build|checkout|for-all-repos|menu)
+		KAS_REPO_MOUNT_OPT_DEFAULT="ro"
 		KAS_CMD=$1
 		shift 1
 		break
@@ -207,7 +241,7 @@ done

 KAS_EXTRA_BITBAKE_ARGS=0

-# parse kas sub-command (build or shell) options
+# parse kas sub-command options
 while [ $# -gt 0 ] && [ $KAS_EXTRA_BITBAKE_ARGS -eq 0 ]; do
 	case "$1" in
 	-h|--help)
@@ -249,28 +283,53 @@ while [ $# -gt 0 ] && [ $KAS_EXTRA_BITBAKE_ARGS -eq 0 ]; do
 			fi
 		done
 		shift 1
+		if [ "$KAS_CMD" = "for-all-repos" ]; then
+			KAS_REPO_CMD="$1"
+			shift 1
+		fi
 		;;
 	esac
 done

-[ -n "${KAS_FIRST_FILE}" ] || usage
+if [ -n "${KAS_FIRST_FILE}" ]; then
+	KAS_FILE_DIR="$(dirname "${KAS_FIRST_FILE}")"
+	KAS_REPO_DIR=$(git -C "${KAS_FILE_DIR}" rev-parse --show-toplevel 2>/dev/null) \
+		|| KAS_REPO_DIR=$(hg --cwd "${KAS_FILE_DIR}" root 2>/dev/null) \
+		|| KAS_REPO_DIR=${KAS_FILE_DIR}
+else
+	KAS_REPO_DIR=$(pwd)
+fi
+
+if [ "${KAS_CMD}" = "menu" ]; then
+	if [ -z "${KAS_FIRST_FILE}" ]; then
+		KAS_FIRST_FILE="Kconfig"
+	fi
+
+	BUILD_SYSTEM=$(tr '\n' '\f' 2>/dev/null < ${KAS_FIRST_FILE} | \
+		sed -e 's/\(.*\fconfig KAS_BUILD_SYSTEM\f\(.*\)\|.*\)/\2/' \
+		    -e 's/\f\([[:alpha:]].*\|$\)//' \
+		    -e 's/.*default \"\(.*\)\".*/\1/')
+else
+	if [ -z "${KAS_FIRST_FILE}" ]; then
+		KAS_FIRST_FILE="${KAS_WORK_DIR}/.config.yaml"
+	fi
+
+	BUILD_SYSTEM=$(grep -e "^build_system: " "${KAS_FIRST_FILE}" 2>/dev/null | \
+		sed 's/build_system:[ ]\+//')
+fi

-BUILD_SYSTEM=$(grep -e "^build_system: " "${KAS_FIRST_FILE}" 2>/dev/null | sed 's/build_system:[ ]\+//')
 if [ "${BUILD_SYSTEM}" = "isar" ]; then
 	enable_isar_mode
 fi

 set_container_image_var

-KAS_FILE_DIR="$(dirname "${KAS_FIRST_FILE}")"
+KAS_REPO_MOUNT_OPT="${KAS_REPO_MOUNT_OPT:-${KAS_REPO_MOUNT_OPT_DEFAULT}}"

-KAS_REPO_DIR=$(git -C "${KAS_FILE_DIR}" rev-parse --show-toplevel 2>/dev/null) \
-	|| KAS_REPO_DIR=$(hg --cwd "${KAS_FILE_DIR}" root 2>/dev/null) \
-	|| KAS_REPO_DIR=${KAS_FILE_DIR}
-
-KAS_FILES=/repo/"$(echo "${KAS_FILES}" | sed 's|'"${KAS_REPO_DIR}"'/||g;s|:|:/repo/|g')"
+KAS_FILES="$(echo "${KAS_FILES}" | sed 's|'"${KAS_REPO_DIR}"'/|/repo/|g')"

 trace mkdir -p "${KAS_WORK_DIR}"
+trace mkdir -p "${KAS_BUILD_DIR}"

 if [ "$(id -u)" -eq 0 ] && [ "${KAS_ALLOW_ROOT}" != "yes" ] ; then
 	echo "Error: Running as root - may break certain recipes."
@@ -279,8 +338,11 @@ if [ "$(id -u)" -eq 0 ] && [ "${KAS_ALLOW_ROOT}" != "yes" ] ; then
 	exit 1
 fi

-set -- "$@" -v "${KAS_REPO_DIR}":/repo:ro \
-	-v "${KAS_WORK_DIR}":/work:rw --workdir=/work \
+set -- "$@" -v "${KAS_REPO_DIR}":/repo:${KAS_REPO_MOUNT_OPT} \
+	-v "${KAS_WORK_DIR}":/work:rw -e KAS_WORK_DIR=/work \
+	-v "${KAS_BUILD_DIR}":/build:rw \
+	--workdir=/repo \
+	-e KAS_BUILD_DIR=/build \
 	-e USER_ID="$(id -u)" -e GROUP_ID="$(id -g)" --rm

 if [ -n "${KAS_SSH_DIR}" ] ; then
@@ -301,6 +363,23 @@ if [ -n "${KAS_AWS_DIR}" ] ; then
 		-e AWS_SHARED_CREDENTIALS_FILE="${AWS_SHARED_CREDENTIALS_FILE:-/etc/skel/.aws/credentials}"
 fi

+KAS_GIT_CREDENTIAL_HELPER_DEFAULT=""
+
+if [ -n "${KAS_GIT_CREDENTIAL_STORE}" ] ; then
+	if [ ! -f "${KAS_GIT_CREDENTIAL_STORE}" ]; then
+		echo "Passed KAS_GIT_CREDENTIAL_STORE '${KAS_AWS_DIR}' is not a file"
+		exit 1
+	fi
+	KAS_GIT_CREDENTIAL_HELPER_DEFAULT="store --file=/etc/skel/.git-credentials"
+	set -- "$@" -v "$(readlink -f "${KAS_GIT_CREDENTIAL_STORE}")":/etc/skel/.git-credentials:ro
+fi
+
+GIT_CREDENTIAL_HELPER="${GIT_CREDENTIAL_HELPER:-${KAS_GIT_CREDENTIAL_HELPER_DEFAULT}}"
+
+if [ -n "${GIT_CREDENTIAL_HELPER}" ] ; then
+	set -- "$@" -e GIT_CREDENTIAL_HELPER="${GIT_CREDENTIAL_HELPER}"
+fi
+
 if [ -t 1 ]; then
 	set -- "$@" -t -i
 fi
@@ -322,7 +401,7 @@ fi
 if [ -n "${KAS_REPO_REF_DIR}" ]; then
 	set -- "$@" \
 		-v "$(readlink -f "${KAS_REPO_REF_DIR}")":/repo-ref:ro \
-		-e KAS_REPO_REF_DIR="${KAS_REPO_REF_DIR}"
+		-e KAS_REPO_REF_DIR=/repo-ref
 fi

 for var in TERM KAS_DISTRO KAS_MACHINE KAS_TARGET KAS_TASK \
@@ -360,6 +439,9 @@ fi
 # SC2086: Double quote to prevent globbing and word splitting.
 # shellcheck disable=2086
 set -- "$@" ${KAS_FILES}
+if [ "$KAS_CMD" = "for-all-repos" ]; then
+	set -- "$@" "${KAS_REPO_CMD}"
+fi

 # rotate any extra bitbake args from the front to the end of the argument list
 while [ $KAS_EXTRA_BITBAKE_ARGS -gt 0 ]; do
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/28b675f4baa945175db90bf35aa065de54a2f4aa.1637430993.git.jan.kiszka%40web.de.
