Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP4CXDVQKGQEZC6ONHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCDA60E9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:27 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id b5sf9831516eds.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490367; cv=pass;
        d=google.com; s=arc-20160816;
        b=PLxcroJkqPMbrEp5OMWAYAEH9ITTX4OIeyZeQkSGJyZKfjSD5eGSjlmkARl4plGyxI
         69j5zcJmdv5GVYuUqyO9m5exYaQklk6JLhfrQR/CHXZB258cJgdEYpUTueHpX/Pv9Jco
         x6Qdp9JycfFrsG36jr9W2da10hoZZgFfbgs04V2heFTNMy4NH7KzxgBSV/ZtX5u3h3L0
         bbkUSjGYJZLyGdiI9tyh5oEAArY/WnbjsMFb7rKdRK521ypf5nRDJ7aXWEkler0UTLaq
         wQL+1F977KgGK/UyEsSdHcZOrTSf7anq6u4EUsnUHzqGPNJBDq1m2Ort9AqPITc1bT3F
         HB8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=pAZWrrkwWlubIaPSnSd8GGPKw4XpTycj+DDiBeylDRI=;
        b=biu3MlCEo+l+hqtRF9Zi4bYe40nNserE9H+1gh+bUQkK2BJehKeEW7A9opl8iJ6rN0
         AY8NSfS0b3RoAWBQ+F8lRXN2zplamWfhUEamhAcmYVBrG5KszNoVLxt3A0zRlTtpdKko
         Pz3qGjw7Ua4YZ8u0gaJXFqU0C7s8CFDpsfKgutETtCq1/YBsXEFEuqBT/qi767IgqR9j
         5cT3n5kX0JlOjcmsbFxcYiAzwepVa++Y5pim4DTSbURns78/87KgktXC7pdvC3X7Kbzj
         IkfRgI7xkzgzh5MhRFwpnrxu1/GM95H53HI4j48Uo6O87cZctSiDkdryZuDBj795hqKY
         y5DQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pAZWrrkwWlubIaPSnSd8GGPKw4XpTycj+DDiBeylDRI=;
        b=Png5Fc8Imx4fqgg8ZeFBByHkuZrnbGniDk+F7JJsJPOCWLlKf4MpRh39orud5+2+AR
         xI072nMxF3/2Lk5LvrBxf81waD1Ho/2zLtIoOgSyYZeEwhB+oMTX33oKxJLTUOmF5K8f
         ikpJQPkIvisX/I7t8/Et9tGkfJiAVkLMjiteZnH1w0mlIWGDCy9Hakp6UaNm+e5I4DpZ
         XC6H/A9zyTzD5S5Np0ESNpaE3O1WNPYm/GTpQePxL7z7tMDWqLg2UJF3a8JVaDnGJroJ
         pvYIAWJ15yjRnnwmWGv4FhnooP/P8z4gmdCJfFCSDkhDLl17x1mVtQc6OZJ3kzhULy6Y
         EGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pAZWrrkwWlubIaPSnSd8GGPKw4XpTycj+DDiBeylDRI=;
        b=mDWRa8P85+BBR3xp2bVcMc7i3qR9YMb/dvIYGTPOKQz5AfYhyuUyC2SY2OOZkOuLOq
         2+GpIc7KQsYdgfeyluKU7Y/dj93y9PEKXgFHPrwjm5tFRQTJqojo4/jl6O3/pltGG+kJ
         TyksPZJeDKFS5oSnkQb/zL1yKpQKi+drC7WbluCVf+HaGu+bwRFcd14A3UDOxMuzVxGH
         iH4I/revIsUoY4Ruatw2qYvfRjeaoLKEuTzgDj4ZnEjrfQWHkvI/8ShcBnPG41tAorbp
         T6C8umDme29HGtcErsQ3GMkrhAl2D4VJUyDc7yjGLxvIusIZEILQ7kYe0QwgsPyMa9Mb
         jqJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXdSRPxdGAfMXcOycVm5xZVB8ieAVZkFEVHsBeqPiZPZjxtYAi7
	W/04mcUd2GsGLNKgNoUKvKY=
X-Google-Smtp-Source: APXvYqzjoo2eMftdvvZf/wexsox+ZN8HxY6+3eMJXSFYnp/ev+grELMhAKLwl0OAilRKlqfkqJ6Orw==
X-Received: by 2002:a50:f419:: with SMTP id r25mr34286939edm.57.1567490367439;
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:c28a:: with SMTP id o10ls5053598edf.8.gmail; Mon, 02 Sep
 2019 22:59:26 -0700 (PDT)
X-Received: by 2002:a05:6402:154d:: with SMTP id p13mr35076000edx.147.1567490366626;
        Mon, 02 Sep 2019 22:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490366; cv=none;
        d=google.com; s=arc-20160816;
        b=RFErcyaTLj4svST4SuNtRwcYHkf7GJYLKF/MQotDKCbcDODpy6koYMWeTR9xU6x7yV
         WHhwhxoy1h2CZzQueNGUdMcsNjODe2fG6AISH2lDhUu/s6yXhYUMyWgypLyU3j9ukgq6
         cRRc76m3e/OsOh7NpIEgxYV/M3YkfLGRpNXRa2zBOBpJqZAhPuGti4r41KRH15LLH8pi
         MO5TxRYYjssGphm9qQa19Pr9iIaSs2eKZEQsGLPXiJz0mbSjjrN+Z7NmJx6OdkM8PxdY
         ZqtxbbWX2mJecX67sQdgnedn401/XuB5oT0Ghuq1icogDUiLpNObGklEcFIxqmMM4lpB
         S8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=h+JjgYEc8t/li4dAQXaFEWMTYL9sRuiU3LQNGEud7Wo=;
        b=DJ5A64mHpHJ8UpCkiVX0ECAA0NNnCeXpR4vqFaIwPYJFQFO+E7QZI3Mk65BdhI8404
         MGGdgH1hjuhE00l+IF2K7OQosN15rosHps5MznuFaDrOLBPKiDvlqsN5B3wn0gQpBGjb
         KDxI6VKPX5PDa8GcM7Og16fit1i50BL+fW+uJNb7gk5EsvL+GtpyFhs6m0vH2+PhiwxL
         SWZk+MQxff/vJ3edFL1Yys8fbUZA6/wcQAh13Wya+Km55EjcFIgKo0vs3JYn3LMic8iN
         KB4RkN/zXL5Trm5egu3PmPQqvb7k1kx2oh1uTlWlZ34DtBp2E7S31vYMaE7CZdK/JAMZ
         h5Kg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q18si616284ejp.0.2019.09.02.22.59.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x835xQDe020169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkO010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 01/13] build-images: Drop --docker-args
Date: Tue,  3 Sep 2019 07:59:13 +0200
Message-Id: <88b3eedbc1668c188e57e7e657c5e19bc0f3cd17.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Not needed in practice.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 build-images.sh | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/build-images.sh b/build-images.sh
index ec4d6a9..50ed677 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -18,14 +18,11 @@ usage()
 	echo -e "--all\t\tBuild all available images (may take hours...)."
 	echo -e "--shell\t\tDrop into a shell to issue bitbake commands" \
 		"manually."
-	echo -e "--docker-args\tAdditional arguments to pass to docker for" \
-		"running the build."
 	exit 1
 }
 
 KAS_FILES="/jailhouse-images/kas.yml"
 CMD="build"
-DOCKER_ARGS=""
 
 while [ $# -gt 0 ]; do
 	case "$1" in
@@ -48,11 +45,6 @@ while [ $# -gt 0 ]; do
 		CMD="shell"
 		shift 1
 		;;
-	--docker-args)
-		[ $# -gt 0 ] || usage
-		DOCKER_ARGS=$2
-		shift 2
-		;;
 	*)
 		usage
 		;;
@@ -113,5 +105,5 @@ docker run -v $(pwd):/jailhouse-images:ro -v $(pwd):/work:rw --workdir=/work \
 	   --cap-add=SYS_ADMIN --cap-add=MKNOD --privileged \
 	   -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
 	   -e ftp_proxy=$ftp_proxy -e no_proxy=$no_proxy \
-	   -e NO_PROXY=$NO_PROXY ${DOCKER_ARGS} \
+	   -e NO_PROXY=$NO_PROXY \
 	   kasproject/kas-isar ${CMD} ${KAS_FILES}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/88b3eedbc1668c188e57e7e657c5e19bc0f3cd17.1567490365.git.jan.kiszka%40siemens.com.
