Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWUQY76AKGQEAWCGBRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2E29644C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:50 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id z8sf1024899ljc.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389530; cv=pass;
        d=google.com; s=arc-20160816;
        b=WtVeUu/yH3z3MMc8YRTjwcmobLuQdEtMxJgpqmFq9HwTNthag7CHTKmFuaiAM7UdFD
         BwF4KL12QNP6bfGJMxX7opUN9JKYy6tO6TWSWAnvVM/TflrC7fEq7hOoxAQ7LHtjA8Gd
         /3EDMsrcm4C9wYXMasQNH3Hm4mebpDNVMNT2uP+uP/sfcG7VM7zsiVYaAQMemcJp0roI
         3+cXOwxX7pXWZKM/P1bUF/yp/PpxbJM46gJGHW/gUzG+YRzm250NxbtyKoQeCDIrjezD
         lc9Rk6KQYRA3a6qv1mbKyWXgPYSFKzLpjFk6rkOiuQiJgcY2oSchQy3v45Cc4Yd6EEKM
         o7Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=H9JtpOjxxrM/3c+1MSGhXG9tLaE8D/QMpyuWRNxmK08=;
        b=ybrAtOAqZEvX45J816g2bbPBcKHTv2YNiWTPFJm4NvbUmAVRaZIM9ln+xmWrbEaE/l
         nP7rFxYwERzhysQwQUKc6DbRe9K0zDLUmOhqJjfHh0SEwqGsof+5YmoQgS1WzpQbUBdP
         bmoHKGlcGTmh/tYeI1/kzcaeIU6rlz26uqbM71EQ8Q3a0S8hYBq+Oq3ZqEKiQZ7EFQaP
         NPiOrQvWDYOh4LjgzROgQTiTjiqlFdQhvdXT2JTfgdv3b4CgVv1/ubwspOP6e6F9RqcJ
         mSQu07/dDNeCIJ9HXdrQhOGwk+xAXGHCPS5BHXA48oBqPfAwmkfu7Q0P2m9v2qhDtW0H
         xodg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="TR/Lve+K";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H9JtpOjxxrM/3c+1MSGhXG9tLaE8D/QMpyuWRNxmK08=;
        b=TEYKNh0wgb0qNKJvei0pErKMwbh0f1jFMusxWVGQjlnfy/cSgKlLfE7HkFBjIpoLBI
         m0KRd9S6JXBJJAQyTqoBnB1/ND4SHPO2YfAnzfMswy3lzY8cJBU/LOlFGYXMdN5fmSLu
         nj20Zf+hXBaQ+soBgwo1qdRFPoz5+hUFy17kq99JUCYXOJIWZoVTbf1zmBHSVSG+6nTa
         oe9oCODim97e2x0ykI37SdvIrOKsza4vTeNtsRFeFeV9jnZbmBml9EcC8u2LQJiTblf2
         D2HKDAoeRgFae3sWa+onqtvISnwK780P5MrsCQz+vSbdXbdbxnwo+mLwdb8lV2e5N3AL
         HVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H9JtpOjxxrM/3c+1MSGhXG9tLaE8D/QMpyuWRNxmK08=;
        b=BD8i0iu/k7etQttrSC9J8WLBeVozb/tqSzhwmlEGfGF3ELtzg9ixVdztCgaeWpclWo
         /4+Nxzzc8HsrRyc7NJV7zFeHjQYHOmomjdyi1IRTf6+mu9xBOX1KGw07+XO2sabP2fNv
         8WnMKJGXxLmmYF1lpwNM59d8aX7EeZEsupHrnQvptM1h3dKmHArQu0Gnh3vQlyQv80p1
         ekVsmb322D/WTQFSSnP0k7R2X0htQbsS7Bx/srm/5nP9VDkabOxRzJGsqW3j0RstpUDh
         EbVvr3D+7G4l8KBj372Ia/KCvAON2xoh3EEietYi4VWvKMYFUjYgr0JhpviYbrHjiEV/
         iVog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ce+zookrZGUHQ9KkB7g8rlJ2eV19QD5vEemoySLWoKI1R+eD3
	cfDw5gUKYoS+N17aBapPM2I=
X-Google-Smtp-Source: ABdhPJwR/1kG7wP5Jm+O4sdDeLUKARDoSbdV4EX7S+Kzv6kTAetbfsIGkcqRb/moavv339bU4LyQnQ==
X-Received: by 2002:a05:651c:1077:: with SMTP id y23mr1525856ljm.245.1603389530354;
        Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1749964lfd.3.gmail; Thu, 22
 Oct 2020 10:58:49 -0700 (PDT)
X-Received: by 2002:a19:4a0b:: with SMTP id x11mr1358894lfa.354.1603389529282;
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389529; cv=none;
        d=google.com; s=arc-20160816;
        b=NaqcMNX3nGVrw4V16+6GjlIdGJjG+zaqIPRHWqGb7bNcIQHat2GONDAbMMv+Bvc/zP
         04oSE9U6mrH7RYkxQM7qiuHVMve4+EA0V/hastw62VtGhusBjER1nbEtYniaWtWgB5KP
         0EV3dalyrHH1pCOI+RXXapCCyRa0RVEKvlb1r1sCxxmwrrQWOqWxJ9C0ILr6/x4HDlsg
         nTaWWzoN/G9kDGcgiVJG81hyBfpxfwxWO1cQD+JVdRs2zYnLdIQBpIHfu3LOVij5nB4U
         AeJ43bZ5f7frzsy0M2DVMxFqqX9WYXBWcapc8b0BgKrUcQLvqe4pSGh6Yr6IofTFnkLt
         IjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=gA+3pzqUvR5L9upMhZeqQzWTtb5rL5K3JEI+zdReNOw=;
        b=T9miCt8EYOsbNTUu3LjT74AKqqNiQv2B4anBou2qTv7r738MW11PpemcJskZ1uY2vS
         XFSYwJDOekS2W45S0dLbl7vJiQFSkOxrMl/fY5XkY2m4jGi+s683rBk1uWyHELiVq3Vb
         4WpYdVrJPYatN2l249rGexAQ8m5dOXX3iv6oegiK5nYGKuClSdXrz+DVngGEEzcV2d9j
         1hQvz0aENJ5X8CwgRqtOuE8pzziR60qdEmy1PfjJb/GAFMS7o0J9NFH3weeZplXB1Kpz
         QQQXIoBfH97jx99gJnhjrwf4h3L5dlo/UF90iGSn9xU5HTrN/v3JmROv0GMiMic4LJof
         4opg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="TR/Lve+K";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id o142si61418lff.6.2020.10.22.10.58.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFV05dL5zyZx
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id HcYB0RoYaRmK for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFV01ccFzyZt
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 31/33] arm64: -Wunused-parameter: keep compiler happy
Date: Thu, 22 Oct 2020 19:58:23 +0200
Message-Id: <20201022175826.199614-32-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="TR/Lve+K";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/mmio.c    | 2 ++
 hypervisor/arch/arm64/smmu-v3.c | 2 ++
 hypervisor/arch/arm64/traps.c   | 1 +
 3 files changed, 5 insertions(+)

diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
index 7fbfef75..2f9bdd80 100644
--- a/hypervisor/arch/arm64/mmio.c
+++ b/hypervisor/arch/arm64/mmio.c
@@ -35,6 +35,8 @@ static inline unsigned long sign_extend(unsigned long val, unsigned int size)
 
 static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 {
+	(void)ctx;
+	(void)addr;
 	int err __attribute__((unused)) = trace_error(-EINVAL);
 	while (1);
 }
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 1f83e389..6192a82f 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -574,6 +574,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 				      u64 *guest_ste, u64 *dst, bool bypass,
 				      u32 vmid)
 {
+	(void)guest_ste;
+
 	struct paging_structures *pg_structs = &this_cell()->arch.mm;
 	u64 val, vttbr;
 
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index 26a58f4d..b2c21e7c 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -72,6 +72,7 @@ static enum trap_return handle_sysreg(struct trap_context *ctx)
 static enum trap_return handle_iabt(struct trap_context *ctx)
 {
 	unsigned long hpfar, hdfar;
+	(void)ctx;
 
 	arm_read_sysreg(HPFAR_EL2, hpfar);
 	arm_read_sysreg(FAR_EL2, hdfar);
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-32-andrea.bastoni%40tum.de.
