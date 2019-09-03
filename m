Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP4CXDVQKGQEZC6ONHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 15369A60EA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:28 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id y66sf6717385ede.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490367; cv=pass;
        d=google.com; s=arc-20160816;
        b=KRxgDCoOf/ZvqK2tYDrsokWRseU4alYnqUjNyvjf/8t4XFlQ+Jgkm8JypLiprI8KWv
         lUCrtXRtHWXqVKOPm//anDyrgdc0QWT8gkfTchUXhK+fxR7yt1uABX2t9vnxwv2ewlgK
         7OwAaeStQK1gg+0nQEG009J4Pp87qK87v9YNT9HqhEoNpDmoH0GYDKMJBSRrPqFYPW6t
         Aoe8p6af6Kh9kIKNDzB8CXeXt2DvJfP76QqaqAhQgmgIMKlMN394AN0AS33gYiMtHFNs
         /A5m88zmSkwVoMKJCyq0c0Xi4OmY+axRG6uvUKktN9d6dWTkel8Rxn2g2Z57cGg68rZN
         KnvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=MWWVe3J2tA5UCcNNRa9oIj2xBFZz01YqHIxu4/aLXDU=;
        b=O6YOHa+XUVD0lY95mP6tUoNpYDxtMwGrOyD6AzjkP2xaGcGNIlGhD4Rcg3SLT3mr24
         wWZXCo+jDAspWo3fJmCWHxkcOt6ocsewJZWRNk/emwmtPa9CY14A/N3xG7bOF2PuGyBQ
         NCO1dBgP0zlnn6PBMilEe0yVg4yyBUYrcszN/ATojPfEc9ZJ37YyIw4pudP+e8szb90L
         HeHdXiGkrwaXXrNdOHDAsF9dW8YJpxEobG/T7mfdT1l+ysmaTlk5GyTgD8T7rbPR3NLh
         7verfAgK1doI3QuXjoRWcMmvhqgQwqhU5GuQdnyiTTjTdPADlcAy0S3hL3MVWzz1wlS7
         XdAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MWWVe3J2tA5UCcNNRa9oIj2xBFZz01YqHIxu4/aLXDU=;
        b=abnCmlzdmvELs4ENnepJam+cGqF/LH/rWOtIpXdt7Dcw+9IfiwRnPmFpjl1RPRGD3Z
         wDGGLEKhWS/VSpG40OcwnnCGEa0Rcnb9q9ScVZKM6T+jFBvgUj7/9PJm5vINiKKfCsyH
         aO+aw+ExhXBI0hx0a8YjQbsktZfhHU+f/qqOSj4/LsiJa4dZf5OFO93ehwX7qA+65PLN
         uUfHUR/2rmYATz5J41dOQuH2PQ4oQO2uFjRJgkBNpYwI0rrGYeuBLs8P6mBr+5dYfh14
         wznsIvcO1hh8DCmat32DgQ1H57M6XVV1yAyAzbsl5zCBBvHCBzoIWM5zskMytjluT/6L
         seQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MWWVe3J2tA5UCcNNRa9oIj2xBFZz01YqHIxu4/aLXDU=;
        b=M/lsNWTkoHzHkuYFNn8tMnqzqRc/ECkvjDcdFEoxUzSfSM09GKVLWfbKEgMYf8AGqm
         YO7Cj79SssOBkOgq/lwvfyO9GLQ3VJxOvSVEywCykanCKZXITryx4IG1VSP4X2nQ6/zR
         iO5n46kNpTUV2TGtBfbUkmTxYkdXHxCizVpUVJw3WuQf6rDwQT4zOFE+gIgk6tkpGE8k
         C2i04iNtWlEUd+oz0PQsTuG8mSKEP7IDQtp0SKsQM9l5Q+vHxQVRtQSbg4KEy2ozyy16
         brOYHw/UIQ2FzMtFO6SAaEkXkoBOJI+5NX4adDR3eApEcQdNEhpqnjtlHcxdPxX8Ki8j
         rkJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbvkmovv22cxhe1FTJpPqoqLmc72EfMCugpwMx3S7okWUZUVW2
	V/BvgZswfTiZFcksLY0p2xc=
X-Google-Smtp-Source: APXvYqw90oxyLyLGig8GY7+OiuVrX10EdmpG8JcYbnVoxwlPnhaQ3efeD4cgrCQNVaMZR+ne42cE0Q==
X-Received: by 2002:a17:906:7494:: with SMTP id e20mr16029975ejl.166.1567490367781;
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f0d1:: with SMTP id dk17ls2530800ejb.12.gmail; Mon,
 02 Sep 2019 22:59:27 -0700 (PDT)
X-Received: by 2002:a17:906:a2d6:: with SMTP id by22mr236091ejb.133.1567490366978;
        Mon, 02 Sep 2019 22:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490366; cv=none;
        d=google.com; s=arc-20160816;
        b=WgaLNVn9FsfXOVnbDgCzyIlmBGuOETkzrycH5cj6WCOcREPwkpMMBR/cbLh2lliYiE
         0fJNT45mZT1h1SpVbQ8h7Nr6LCTaAjrwrxMkisv3VDBbKA3RNL493HLyw3ThwjyvKi7a
         h+ErzAO2Ttdd/u+q72OxqFogsL3ZU0WdukGmxhlFmeFFPPay5fn2VrE61HXYngQliePc
         3qiDa171E5V0G/Lq+xNkVeXnZ1E5kAqFdqdMSAj13XwXO/rW+9otHE4b6gM2+qEcTsNI
         zuyQqGD9rR31OMRAJ14EUKJu0gG4+EcTYUeq9PvLDeCWjkeBNK7POxgK95uXM70sT6dE
         NsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=hM0FQ4YNiD66ZZADSN798WygFM/moHviiJdj7U17swE=;
        b=yAPXYiwRkpHVCKWGwVAuJxGUPI+Tb4CwIRX2rvYRbR55s21r8WVTWxvgJMssh1+t68
         4dnuwjT8z+VbQ6DLisREuMnFnbbIbI2RLgQ5y5wvKVxmUwpCzEMo0kexGs6Nid87PG8y
         DdrIUdhY++WjOuiVPd8S8zDK5Brn9u3O2/2ZplUenxkzJRAVKgRrJcYCosmf74VSu++k
         cz+wu94KL6abTCa4vpTJfRfMs1fMi+dDFnrxGBVx83Kjkd1/I4nd7bCv/qSapP5Fp9bK
         iOlmPBTOSwQjMROhAivVoYZzLEKZjQJ7ODaHJvWFFc9xdrDM0bklJjlGHrCZWD9BBcuW
         ljrw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z31si404048edc.2.2019.09.02.22.59.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x835xQwo012469
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkP010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 02/13] build-images: Use latest kas-docker internally
Date: Tue,  3 Sep 2019 07:59:14 +0200
Message-Id: <458367be5bd5bd94f0f971fdf15086c0dac3e061.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

By now, more mature starting of the kas-isar container is achieved by
using upstream kas-docker. E.g., build-images.sh still forwards SHELL
unconditionally, breaking on hosts with shells the container does not
support.

Therefore, pull kas-docker on demand and use it. Expert users can define
an own source by setting KAS_DOCKER.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitignore      |  1 +
 build-images.sh | 33 ++++++++++++++++-----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/.gitignore b/.gitignore
index fe0ae1a..43892c0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
 build/
 isar/
 recipes-core/customizations/local.inc
+kas-docker
diff --git a/build-images.sh b/build-images.sh
index 50ed677..28c3a50 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -2,7 +2,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2019
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -21,24 +21,25 @@ usage()
 	exit 1
 }
 
-KAS_FILES="/jailhouse-images/kas.yml"
+JAILHOUSE_IMAGES=$(dirname $0)
+KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
 CMD="build"
 
 while [ $# -gt 0 ]; do
 	case "$1" in
 	--latest)
-		KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-latest.yml"
+		KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml"
 		shift 1
 		;;
 	--rt)
-		KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-rt.yml"
+		KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml"
 		shift 1
 		;;
 	--all)
 		KAS_TARGET=
 		while read MACHINE DESCRIPTION; do
 			KAS_TARGET="${KAS_TARGET} multiconfig:${MACHINE}-jailhouse-demo:demo-image"
-		done < images.list
+		done < ${JAILHOUSE_IMAGES}/images.list
 		shift 1
 		;;
 	--shell)
@@ -60,7 +61,7 @@ if [ -z "${KAS_TARGET}" ]; then
 		MACHINES="${MACHINES} ${MACHINE}"
 		NUM_MACHINES=$((NUM_MACHINES + 1))
 		echo " ${NUM_MACHINES}: ${DESCRIPTION}"
-	done < images.list
+	done < ${JAILHOUSE_IMAGES}/images.list
 	echo " 0: all (may take hours...)"
 	echo ""
 
@@ -93,17 +94,15 @@ if [ -z "${KAS_TARGET}" ]; then
 		fi
 	done
 fi
+export KAS_TARGET
 
-if [ -t 1 ]; then
-	INTERACTIVE="-t -i"
+if [ -z ${KAS_DOCKER} ]; then
+	KAS_DOCKER=./kas-docker
+	if [ ! -e ${KAS_DOCKER} ]; then
+		wget -q --show-progress -O ${KAS_DOCKER} \
+		     https://raw.githubusercontent.com/siemens/kas/master/kas-docker
+		chmod a+x ${KAS_DOCKER}
+	fi
 fi
 
-docker run -v $(pwd):/jailhouse-images:ro -v $(pwd):/work:rw --workdir=/work \
-	   -e USER_ID=$(id -u) -e SHELL=${SHELL} \
-	   -e KAS_TARGET="${KAS_TARGET}" -e KAS_TASK="${KAS_TASK}" \
-	   --rm ${INTERACTIVE} \
-	   --cap-add=SYS_ADMIN --cap-add=MKNOD --privileged \
-	   -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
-	   -e ftp_proxy=$ftp_proxy -e no_proxy=$no_proxy \
-	   -e NO_PROXY=$NO_PROXY \
-	   kasproject/kas-isar ${CMD} ${KAS_FILES}
+${KAS_DOCKER} --isar ${CMD} ${KAS_FILES}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/458367be5bd5bd94f0f971fdf15086c0dac3e061.1567490365.git.jan.kiszka%40siemens.com.
