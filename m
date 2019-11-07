Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR5DSHXAKGQEORCNB5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id BC978F358A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 18:17:59 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id g16sf1855718edp.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 09:17:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573147079; cv=pass;
        d=google.com; s=arc-20160816;
        b=yGKeMPHEkSX2S2RF5ACAHWJQTa4h3XOq0L+F83G2Yc5tywLGZOa5+nRu7gQ/NEXkrp
         hcHNiZMs1MH/UwirFl+jxf15H8HVdFWaviwRjj7/8nsKBxDYAGaGr+C0zWNXHxjU40r2
         20oa70LTvztkc5nNK8Fy/vJiyCYRbJpDgE274nH9yWGH5+S1vYHwMKljVreUCsOgeMwS
         TBHwDIdeY0108izIoWVsIgSI8VDuyGgawXbFE1TXvQqDKU4OyYRHCSZaAnUVOSvZHYDm
         Aq4rMOjHZXUZ50gVNclxd9i+Wgie1j4Nu7t6dmjT+8bu4a1utfuQWDb6Tu7zU/g9ITjt
         mvaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=zoI0OrPOBot7XvvGPu4Gx+mW+hkTXoFXG71VxWxoReA=;
        b=GTnKRrPRriOTnT38dqb4dJxiQrlpoFa7fZ2w2Jcx3KO2jJY3xo3ArQE6SGFjYCVn3M
         FT3BLR68Ei/3Rtd02AWtwysuxzoMehgqxhFKXZRq4gNgb5i0rCDDcvZ/9nX9dqOA9a9E
         LfV7v+DR/GcKt+wvM423VjX55ekcZ5F6r/dgOjyaTzz1brW0EJ4MmVrZr22VvUAekbFX
         JgCQjJGglo7zL2JEAGUyAVZAvEeIY0Y43L3THxjTzUUeI/TunauLElMqwl2bSJLjaIQC
         4CY+rxOBN4jEbux+SymkxWCGfgHRGCMKPLYEN59V6xY/P4QKvIRNNbw9UR0+4/Glxltw
         WyNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zoI0OrPOBot7XvvGPu4Gx+mW+hkTXoFXG71VxWxoReA=;
        b=kmwfdluExMgofH/6oe+wnyLL2IjyB0crEPejcimsWFewR0UemqGfsL7kQ5VOyurgHR
         oLfyy4oUwMNsHLaq9B2y8/E6CoQIyhtltRWiJV2IgHet928/9pXeMgeVyFFLzzdzgCSu
         DqwNh3x3kSgmcaPkPxhFn0NrQ6XAL3daHFrzUptf2q7ee6Sd6kn6VKk9Pd6ZCoMatArf
         +mEjKyuvN4SDb8/789Y38YJPOUTcQlhSFs5D9zpIeFgkYsiip3BILd3imT7lRILF4X1i
         kRhRozeA6kayrLOrdryaMFbELjRfpWwZG0iBcm16BBctg7ukrLvay1mjBWFuEzEhkCFb
         jbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zoI0OrPOBot7XvvGPu4Gx+mW+hkTXoFXG71VxWxoReA=;
        b=YkAtbTj0t7wdKTPUQoQlaKKpM8A+v1ZSltD8qqvZsS7BkGPsj/d5Ngru9Px7zQU8og
         GZcuDqRNXdB5PQFPoy5UX+50eC60kftjtB9dvcAF5aG/ommtltW1cIgJVxkLMt6BBFxa
         7edkjCjBKnG+mT//1vOxqJww0b3rC9M2W4BRxpKhUnJnPo+ubH2kOIVIjOeddhW2lLce
         XRCW+GrBDl/Ui0AANm3frMCwvYMTGgdVxlU7lGhQjD1ZPVsceTPSEcFbUevlRnhT9uYa
         rHWMV1KGULUoMemTkbWjlznRqt8HZIe/XLG+agbUPBR78rV2aWE0tKWOV+m8g/b8Pf2v
         8fHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4IjyW7ajHD0CtLMncEi3DjBTSxBReDOtS9GO14UmnFCXiJTNr
	4DSm98jOy2OCqmoOz84OKF4=
X-Google-Smtp-Source: APXvYqzQixIAlgRE51086fSNx9601I0Y49TXKqP/L3MQLrDAlN0+BDVGmO4rDiCLYZsyxl3XGvhvHg==
X-Received: by 2002:a17:906:6083:: with SMTP id t3mr4165865ejj.145.1573147079345;
        Thu, 07 Nov 2019 09:17:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6a4f:: with SMTP id n15ls829326ejs.0.gmail; Thu, 07
 Nov 2019 09:17:58 -0800 (PST)
X-Received: by 2002:a17:906:ecad:: with SMTP id qh13mr4229622ejb.25.1573147078601;
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573147078; cv=none;
        d=google.com; s=arc-20160816;
        b=xUriYiB2vfdyT5tWtqkEdmuxl6G0UxzKhGjcJ1WqzgMvQcZgMV/ag7vprTMu5PRyme
         En+Dx9Y/JpJ7FD0NRaGpyka8mIn5PPN2Bw0B6nvjwdVM4afY/XbyJIpJjeBQvr4l5yls
         enfh+1flgoJiDvy4z5lMSo+m2uAT8NqkFOqsUzQ7LX/PWeXWjKW4pQRcZtdXRjZqZxET
         SmkZXFiHcEsQkdqDd8P196DZxlY0S/IsOiHDNNH+nlupeV+6RCFMOm2yNOM270ZdxphX
         71NWxqMW1Ouo43MK9Mq42qgBAAjJZ8Dgowu7cp63Eoiuhq8fzg9casMvlU3kcWFnZxN/
         2xAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=mrLW5WARLL2SzUZjuSD4qtw3Q6f2iMdiyMOMjKAf9Js=;
        b=kBx0JhR9Wx9/wADb1ZwOm3ceyhOKE0RuqoYWU07IXO3ZZOSUen8RPn9ApJOEflkDR1
         GHvho8vqW32StkO+VLlbAm07Ad3DHQ5Y39kexk6hvSdK1kg/ez+T66iKbFjNh6PZBOsu
         Yu4HXUINwku5lKIRSaouE0yg7iQmSkQI7GxJpCkavUhl3LAYyLztK3Iz4s/+jKPwYumf
         7+qdexgv5wC3y1C2uXUZWMyfSazNFX1EAW9lChlHRfPksteMt/KytV+2Kx2esM2joQ8p
         dgG27rMoBItzibOsb++BR3Ukvv9pnNUVDP4s0Ov5VVloiAxbpPWe961G8XnlQe5GH/r5
         MShQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id l37si264258edc.2.2019.11.07.09.17.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xA7HHwB1009843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA7HHvr0012202
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/4] linux-jailhouse: Update to 4.19.81 and 4.19.72-rt26
Date: Thu,  7 Nov 2019 18:17:54 +0100
Message-Id: <d770455e0cf670f71e08a6d3a2286ca3cf7f3948.1573147076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...ailhouse-rt_4.19.59-rt24.bb => linux-jailhouse-rt_4.19.72-rt26.bb} | 4 ++--
 .../linux/{linux-jailhouse_4.19.67.bb => linux-jailhouse_4.19.81.bb}  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.59-rt24.bb => linux-jailhouse-rt_4.19.72-rt26.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.67.bb => linux-jailhouse_4.19.81.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rt_4.19.59-rt24.bb b/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
similarity index 72%
rename from recipes-kernel/linux/linux-jailhouse-rt_4.19.59-rt24.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
index cae13ed..52c54da 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_4.19.59-rt24.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
@@ -13,8 +13,8 @@ require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "02e7eb3ea8366785ae516ca3bb9cdd2d3b83672b543b8be12a4853b02f2a6279"
-SRCREV = "643fa6fcbe61f5db2120aa8757bc02faa56988cb"
+SRC_URI[sha256sum] = "2d4640f928e237254ed4242f75c6133853859d38aa08a6b91fc3a919caa0dc7e"
+SRCREV = "90c6f75204884080b23d30424a4eff313dfeaa7d"
 
 do_prepare_build_prepend() {
     cat ${WORKDIR}/preempt-rt.cfg >> ${WORKDIR}/${KERNEL_DEFCONFIG}
diff --git a/recipes-kernel/linux/linux-jailhouse_4.19.67.bb b/recipes-kernel/linux/linux-jailhouse_4.19.81.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_4.19.67.bb
rename to recipes-kernel/linux/linux-jailhouse_4.19.81.bb
index 238bfd6..b3027fc 100644
--- a/recipes-kernel/linux/linux-jailhouse_4.19.67.bb
+++ b/recipes-kernel/linux/linux-jailhouse_4.19.81.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
-SRC_URI[sha256sum] = "e70f225edee1dfe90cbc7b5bfcbb8c39c0a8ab34d0be379a4be417952420a7ad"
-SRCREV = "b8f584b391bc90920008708d77d6bc880f61965e"
+SRC_URI[sha256sum] = "07ca5f88e1ecd68cd1408780c7cd25fd17002478008af2531f4ed64c827678fa"
+SRCREV = "c94c49b84d7a7adca2320d617d3a7721eb753e3b"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d770455e0cf670f71e08a6d3a2286ca3cf7f3948.1573147076.git.jan.kiszka%40siemens.com.
