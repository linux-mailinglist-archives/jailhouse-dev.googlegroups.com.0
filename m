Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHB66BQMGQEFDW26XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 30578364CC3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:33 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id z135-20020a1c7e8d0000b02901297f50f20dsf49776wmc.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866393; cv=pass;
        d=google.com; s=arc-20160816;
        b=0oTJv49bCpb3A6KJfYnH1gwApZH8SF2mfDVwCW931TWGTGqGBnQWgWZuCKxXiT+jE8
         taax3gCim0yZpxs7XKkBXv6XrzSC3RkpdvNPkWmyGeQbqpPOJ83vpBYpaf4ZKCU4qs9F
         r3TTrgjcRRMoij+3biYAlkV5epud0/LRBAtKlMqyAjeA2Cf1H1nLtKE3O3nj4k1yMWSl
         /8qRrhcM5PEW6BYTQITVgb06RCn7CAud83bAOJ6cMq0w0NZ5lhpBdGdahDO+YFH4FYNt
         p1Ze4y8wIpDEJ60mk621vsjdfYASODuxLddr3Bx6Wv9dWIZ7xldHPEYoOQschQiGY6YO
         iQxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=GoRdms83VAvzkodbS3p9u35iK/GX70fetT685zhEXGk=;
        b=y7VOlSZ1+qg2RBk/LWMRtZbCtacyW6z/q14QydqjlQ22giUjEgjZWoicugCdoWd/4E
         avjrvirR2oSeMPjQXBCB/nZvnGVxjK7PqGqkmYXUbl3Yizz5OwgVpEfKLQHnJW3auFhf
         GY9uqCyWsifkPtzQOBYxX61REHhH0tx6myHXQAqJtEk0k60p5Y+Ivf8NnIBHuMmGqxuT
         Ljbk5V8bTPa9cOPTczD57ZQ8Tg/FiLo9HY1+0iRFCu6PCV3wAuxn5n1UBLdvggOcv5rR
         jcWng6IruSLoGYcfXZIUvjGe2De6378yhIHP3GBAN8W+g+/BNczQDCnS4HpUj32k1T3+
         1GMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GoRdms83VAvzkodbS3p9u35iK/GX70fetT685zhEXGk=;
        b=oU+P6rtpKYfrkOnfkseYCKXlrVL++J2uCuAcU+qxqlCL41JabANIkDCJEEaFPpOmLE
         9Iyok0jEL/WrA67UUM5o+CIggUqdX4n61btAIO3ZVonhz1HQao17dpIwg7k1HW8HPCHQ
         PiQdZ4nwZLTwhoB4K1pPiQrGiFnqE0qpKrDZlvrOjVdnaMRSxBwAkBWVcBmZqQ5HZhC1
         jt3wazwohnlK/LH8NdSDQoOGb/v3s3C68oiBp1sFUv6wv1d6wljQB0gHh2uX77xm7r2a
         tmZoSFAL5GUi0V8mHlERR/Caa3fndIgV07EjdmiBjmIC4sQJEE+8oNAdC4F6xpv14Nr0
         6cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GoRdms83VAvzkodbS3p9u35iK/GX70fetT685zhEXGk=;
        b=djigejW0klnWcNB9lCH3q4m3qfego77QjHU4cksbxxX9ll4mEUKOgPfUXaDt23dX5E
         /jwk60BCuSHLueebF0sGxxGjumkLzoiKYCjwkRsOtRxNTJH23jBXskEg20OK2igsz+1j
         7F35tRqyyZ8S6b6Qtm+B39Dr2yA4/VXzNOYo/QhCzSJNiDLkKVDQVyDFCh9yToRy9WZT
         NufQjeCv47NJcYYQPtJ3/EgciVQ0oOx/dgwp4VVTRL5E1xoJh7mf/NaKHFx56RTyd312
         pruesSsP6jzVG0Ljmb5tus0Q43bgWFz/KiAFklpBHzrhPmuuYGa+fVPDN6FeeTkyAiQ6
         6ZfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530cCRBzGRlsxzzYnh/Gg0/3g855kuMy8jlGtp5oF0uXlEO+N9LD
	tajEKZMLLbEuxdAkCyUYSmc=
X-Google-Smtp-Source: ABdhPJwFPbs9wlAt5SKH8I+nl5btQ3p4jJaTAgMUpauP99VEadw4x7+ITEpgqY8gE0MVCo3ia3TCjA==
X-Received: by 2002:adf:e790:: with SMTP id n16mr16219190wrm.278.1618866392984;
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e5:: with SMTP id g5ls9314704wrd.1.gmail; Mon, 19 Apr
 2021 14:06:32 -0700 (PDT)
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr16599297wrr.358.1618866392133;
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866392; cv=none;
        d=google.com; s=arc-20160816;
        b=NeCwXDVKZ6KBdMgGzOHCBu4Hw88k7hYWuBcZQfFIQl0j2DX1+gpQHZAUagOtymngDO
         o5KbhMwgU+GyiTH4LlGwawlEDurU2YAyhx/PrOGTka5omuvdccKqG7Tav54yQsnetpkz
         BaXnQtp6G5dWtaD4vcEWjhiZRcwDFv8vbrolHKgx71WpahylGkvtxo4S6L+FwcNNVriD
         x+e4cnIxw0RTBelB8isyzVgSX2KsX5zVWh8GZfwbo/ALYbNWBSj82N1ADojiRsAAW6uu
         Y2A2zO9+MERvQS/a6De22GXxMLuEDpsD+ve+4Ge1yZCP7s38xaJgQ8mkCzz2ZG6SmbXn
         00sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=PD3kPZKDjlCU1vr9O2lXyct51ckGqr3pCkabOCPPulM=;
        b=MkWVq/NfWOytLbcWFge7gHn/2CgdQnJqjDmDuzJRfxiu404zZ5ZMKjdxme8Xfq9iXK
         QDdWXMaxSIJJWK2nDGwBkWITTTTrY+GsxKXmdqGplO2M73tSlnbkceCchh+Tz6M94QGW
         lnuvp9FqrTHdgmmNjEBMctsh29W3Ltkt2f9rJ7H3pWZc4Dkw+8o6lE1KSjQ/Q5wlZ2kh
         wCIOtyBJ5kRcot6SmYjpMHcd4fe5jZhuqV/9kP3SsougjbA32dubUy8ZHG9zDR8q7X/0
         Wg9owA0q1pUtidwG2YE8UAvXdk+Ccy7z30GGyU91G7P4PzSAOyKZA73KD6G3BEJOhX1v
         KN1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 5si994754wrj.4.2021.04.19.14.06.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6VZG022117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpb015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 08/20] README: Add QEMU ARM support
Date: Mon, 19 Apr 2021 23:06:17 +0200
Message-Id: <2fb5e439c5d9ae7e6cb06d7cca1e98c7d4b10632.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Lift the minimally required QEMU version to 4.2, the one that the ARM
target was tested with.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 44bbfb4..cbceffc 100644
--- a/README.md
+++ b/README.md
@@ -13,7 +13,7 @@ Quickstart for Virtual Targets
 The host-side requirements are:
 
 - Docker (tested with 19.03.5-ce)
-- QEMU >= 3.1
+- QEMU >= 4.2
 - Kernel >= 4.4 with KVM support (for qemu-x86 image)
 - kvm_intel module loaded with parameter `nested=1` (for qemu-x86 image on
   kernel < 4.20)
@@ -21,7 +21,7 @@ The host-side requirements are:
 To build a target image, just run `build-images.sh` and select one (or
 both) of the QEMU targets. The generated image can then be executed using
 `start-qemu.sh ARCHITECTURE`. Currently supported are `x86` (only works on
-Intel CPUs so far) and `arm64` as architectures. On x86, make sure the
+Intel CPUs so far), `arm64` and `arm` as architectures. On x86, make sure the
 kvm-intel module was loaded with `nested=1` to enable nested VMX support.
 
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2fb5e439c5d9ae7e6cb06d7cca1e98c7d4b10632.1618866389.git.jan.kiszka%40siemens.com.
