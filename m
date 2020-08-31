Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFNWP5AKGQEIOIOR2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E742577C6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 12:53:53 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id a81sf587298lfd.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 03:53:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598871232; cv=pass;
        d=google.com; s=arc-20160816;
        b=VlOVjODQD8jUdprpA6/YGKrSinfzfVXQai+lWlRNl6TAu59Yxoc91ZwToN49xIuIbw
         tx35egm1KGJET+5IgYLBAUlU2gHFMb9x9cSDJp0QuruPDBAptNTebBfVNL7uxuD75Cvn
         pMzeINBhaB7jQXtZx0wayTLi+YvHqhY0do/nF3mAnvnooDPz5Em9rHBTNMx28xiHa86i
         0kH3EzTjNy/XEZx9TDBo51SgJvGYILMuxSBVnOUuXfypqR01Y4hTuiGb5bWlFCg5KzX4
         Fn6V2aUirqDhPy52/+SLmkUWjyF2HrpVSxo6Vhe+cXQAVckoUniHnLuafO0kt/8qRyuV
         bm/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=nUJBHGXqbN+pYNDz3vd9yWIe2/tN3Rt4TPyKpxOW+H0=;
        b=fZv5d9xSKQGiBP7/JcrthGPd7Wz9HlCqwFQvohIpdnq0K9PQq581M/yMCsJaXY83Hl
         HAnRa7w/tSbft/b5IpVX+z7+BoweWsAt1iY9ohlQn/ollnwfJ2RgO+ieJahZw5fP2Ytx
         p+xlrIGdBJ5JDgjzdyMNcw3/A4H7Z6jlK1dfYyITd1MTVY7iA+a1sxm+TQQmw4PxjHlm
         tMmcrAX1+EXBU9p0LB5DFuhS2LqEDOL7utJw4OH9H3K7aqruG7cOGe2JmgALG4et78ek
         gvkqZ4i1lRxK2txYa8tLZhT4D+slqlE/SRm7KLh7M8yAr14NuNlQDqsUNR7k8YOKU+SP
         gJdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nUJBHGXqbN+pYNDz3vd9yWIe2/tN3Rt4TPyKpxOW+H0=;
        b=seJGWtsK/FAHEdkJYTl1ge+SkFJu41nk4u+f4LGE6qA0cUsx1x+8RsCsJSFaD4umUa
         6dAviC478IA7FVIZg1j3tkevNDZqrQuy05tNmB3m7CjJQetuIHJU9x5fB/c/2tj6QOeB
         Chczg9gyIbEdUNrbi1HzJj7uUO0KLyyEwU/fJZCrHZoO0kVcvfUmQj0y5CQgdvIk8g5q
         eC3hP4Z/URATD8G1CpAN8FC/aITha9snccf3+W4o1LMQUsiR/NYmgqMW3ldEHEjoo40B
         Xu3hlRCTlTa8MWnwZIO36k5eQ0cMN+IlRm8wWcjwZjXx/UY9DteOAF73TtSKbLL+sxYH
         csUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nUJBHGXqbN+pYNDz3vd9yWIe2/tN3Rt4TPyKpxOW+H0=;
        b=aYhmfJxK27LNm1Respt8j/OVf2i7E+NbhES/Zn4zHUtPOKDwggrI72AG6b3m5NvWaH
         bXwGtWsKGOad8vyLzA8mjX0goj7ODSuKiOvxoz6bou9WuSV0IYefVDLlDj59uPXkMWL9
         SV4gCO98EVeeKRIBWO9Wmn7r4XArNuuXjzCuk608Cu4WRhU3EFtQu43QhotLeetSMOtk
         KHNaRis5+X8trunO3h/2y0WmRNseDQL1qeGkx3oBfmCXTaOfPE96qhi362vWDtcoZwJD
         VL/9Vhph+C5HENvcQH0JmF9SqquxARIYhYZ5Y5loubAOYc3cvV0pQ0oOaTyd7+EitHum
         Iwag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325Ik9BILLsBGPW24KiHSvtqPUC+Lwoc1dlv3GpHEjGwFetSsd5
	rCuN/zUksmgCh+g18OTgPIk=
X-Google-Smtp-Source: ABdhPJyl5634PxjDvYpkNRnx+Qzwf7w3e0ZjbQSRq3Hoz62JnfZ+9gomSBnVP/p6wodqjJfsojh1eg==
X-Received: by 2002:a2e:504a:: with SMTP id v10mr425685ljd.428.1598871232584;
        Mon, 31 Aug 2020 03:53:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c03:: with SMTP id x3ls975123ljc.5.gmail; Mon, 31 Aug
 2020 03:53:51 -0700 (PDT)
X-Received: by 2002:a2e:7a14:: with SMTP id v20mr397086ljc.429.1598871231552;
        Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598871231; cv=none;
        d=google.com; s=arc-20160816;
        b=YfXbsGckT44jbxs3b+FCzOLRocQoaQozF2A4Rj+GTXjJyWNf29ChGiXrNo0cJradIN
         YhVPHPWKccy1c+dxgfiilidT4EJ5h3pk9guPZFKElpjhSGg8vlCCXVxFnvi4JJTTFWWc
         mjTJ3l25qwGUVNhOm3fOTPjNxW1Ol3DKYwaT9fA3o60DTWNrV8MFaoEtujq9XyahKa0r
         VnU9ns1FfLJB5XrTN6ZcKbC+jWAfPzD/85CWDXs1HpPgiOeLKOIHBdnQeXcPd9s3ya3X
         Kz1g9Kg0JKZG9vLf0J5C6ubdDnRbHVrlTO9EtEWT0SLC/TMlMguyzzZhH92EdGaynjhp
         B0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=g/fvIId+JXbDbvAfYjjLO/EFiLIv0If1YAG0HtaMhKE=;
        b=MXqiz8cb+/kaW//hwJTtZToWeO0njhIl2zmY6kbiPyWIFknzm1aYaC57b6OMbyteqR
         ONZS3Pjk0QepSTNNJVpFabE9ozUAHRxz3owmfn6yC7WLc/0AJ3U6GfwU7S5gHqSnAg68
         2NVclGvq4/f6wuo/+VTE4j4K7Ot6yv1wx7XGrctO7zCkWzGg9xEN8Ks2F6NtXlRXOpI1
         nYX3sm2w+zfgfdhTdGwixx+8pbZ+UAUBKZQXimE2g++2Z+BZJRjVnoB1F00od7qVK+0E
         hf0Qo2eW3+PqdS3cwYC7OPNqZM8UTjJdWsbQyo4bnU3g2anWMJTJFFXB6YBNeLtAtkbS
         Q1CA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 11si35088lfl.4.2020.08.31.03.53.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VAroFo028224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VArnQj026382
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/5] Update to kas 2.2
Date: Mon, 31 Aug 2020 12:53:47 +0200
Message-Id: <740a09a1d33df34f27ce09267d20afb4f96f3ebb.1598871229.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598871229.git.jan.kiszka@siemens.com>
References: <cover.1598871229.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitlab-ci.yml  | 2 +-
 build-images.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7fed103..0c03ee1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: kasproject/kas-isar:2.1.1
+image: kasproject/kas-isar:2.2
 
 variables:
   GIT_STRATEGY: clone
diff --git a/build-images.sh b/build-images.sh
index f19b324..45f7079 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -100,7 +100,7 @@ if [ -z ${KAS_DOCKER} ]; then
 	KAS_DOCKER=./kas-docker
 	if [ ! -e ${KAS_DOCKER} ]; then
 		wget -q --show-progress -O ${KAS_DOCKER} \
-		     https://raw.githubusercontent.com/siemens/kas/2.1.1/kas-docker
+		     https://raw.githubusercontent.com/siemens/kas/2.2/kas-docker
 		chmod a+x ${KAS_DOCKER}
 	fi
 fi
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/740a09a1d33df34f27ce09267d20afb4f96f3ebb.1598871229.git.jan.kiszka%40siemens.com.
