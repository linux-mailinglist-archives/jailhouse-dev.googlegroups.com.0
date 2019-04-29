Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX7XTLTAKGQEDYI2QVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D6DE78
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:55 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id j24sf2025716ljc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528095; cv=pass;
        d=google.com; s=arc-20160816;
        b=MTtiHNxm5xSeC1URokDXSP6Xy0FEhKSEaw5vXRRu82+RJtNSU3hVEBHVJ7Vjn4QBhC
         meC6ELdthM/XPH+BGhMWsGTz41YykjXJQ/4zV8KtjVO2an0+R3Nd/AUZjs8/Df/Gd2nz
         OmuOudbcXiQGdtPS4kHO+FoiGuNCbwv6LPYaq6D0dAlAHCoTuFUUL1y7Ku3LUK4isTH1
         86Z7OOYP5YBYpdJCYXJ+JI5+S4pj+C9zrpT8Rbfl2Uos+we+IdAn9a5jebSPxJrUR4C9
         HCyYKPsyb4/q5e4FL6gPyzQGoHPm/V8J5DgSufVUaasXVqAXBN9zwoacFpspq1+BairJ
         jGgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AH82NplHEMxBIzcBiC90D3WDpupnSxx8IO2slnFZ6Yw=;
        b=FRgpBfGZfCnYedb/Q4RfiNhBm8X2c4FF4DZS0ZyfJD4NR28noeZ9nGNY/wLwy/m2py
         6I8wgLnbanYSziTRNWP1OWsTBJbSgAHWi47e/pJGXdrQUXl0ZwrsK/aO/JsgyPTp4Ctd
         r18LUx4t99yNFLqTNoVqWafTlfc4+q+B9GNANok2LkDmHwtevuUxejZCvfuyXqiGpid4
         l+LZLm63cAyoLz9HTv/4vqPFlKbLxoHucEUqaKqsOw5qHA+4YRH7UNPntVcfbxrd8NiD
         mLpR1RwuJyxJMyfAR8cWa8J0G6VlD313y8iuVoTUOW7v73nHwFlPAStTVvFJOcdmwsVW
         fUSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AH82NplHEMxBIzcBiC90D3WDpupnSxx8IO2slnFZ6Yw=;
        b=XsESZbuZv3wb7nawtCnZpABYa0kGPE1Lct6EUNAdBJSETotQFcMGm/ZEttcLt4+jtf
         AlqtblqL+5E3PBkBLXLVHM816+omF5a4Waam9g5oUstC28t1wVkxfFW+F+iGcOS8FkeB
         QPc10+5iBz0eX2zmH8x5sxe7Dxd0vnRAz18zRUSgUghy8Nraf6WFGA9jay58bDiFFxGi
         OO9hwhkGohMiMXZZidk4vJ1fiuBw6SbweUv52DdkJUs4eUVF3fYNiwo1Wbs0khA9Rhhi
         5Ka8VcMQrpuwlTP1YaN8OMU3NjCHszgQ6QC2swv0rZm45QdtytXXOF+JYDvbNKQZMmcD
         qYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AH82NplHEMxBIzcBiC90D3WDpupnSxx8IO2slnFZ6Yw=;
        b=r67j/xQPiclehlWcdN50rnKLbm3v01H4/cs7sMqGh5GZQJtxNUJXx5QzuiwUWQ80D8
         9uZG9I5Sem52ulDb2vLVxzm4J8H5jec5t6YprTo91g+pba3cFIl8o0Lwt+PpD2xtiDd4
         vLunVI7CeKs+Ka6rFW7Ukb5j3onGek9ujtmun7d3SOAkhOmRUImA+N4E7EVXVIlhAiPk
         3F0MydToMwUfn3yuZ0vGcAaz4y01BC0/uj4vaab+0BDt22Y498Uvuz7R5twtac8PGGUe
         172Q86VWK/U3dIAy1S93LCSef4189Uv+EpVNRguCf5Ui/g9cuNS6q+nKdBMo+YyT8leU
         KPaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxUkBryGKpgviOubzLm4ydYVGLDYDA1aYECSrKy8Ovj372fGpD
	dNASF+Owy3kbDWCuBY2p0y8=
X-Google-Smtp-Source: APXvYqy0/5eNkFRF6XjyHvbuPEZZgSvx6ZCveKNMmrHP3thidHS3+U7K/Aym53oji0xd/znD6Rf5yQ==
X-Received: by 2002:a2e:9546:: with SMTP id t6mr5738143ljh.51.1556528095300;
        Mon, 29 Apr 2019 01:54:55 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9799:: with SMTP id y25ls106464lji.16.gmail; Mon, 29 Apr
 2019 01:54:54 -0700 (PDT)
X-Received: by 2002:a2e:9bcf:: with SMTP id w15mr310048ljj.102.1556528094623;
        Mon, 29 Apr 2019 01:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528094; cv=none;
        d=google.com; s=arc-20160816;
        b=E2aVyPL0JPN5Z+9LnH+Xr1XZxucKSlGlC0wNWrc3ACu0IqSasW88/cor3hj/wdn47F
         /1li94N1XL75NgXwu/Z3gSz45BJnsgH/zerU5v5NYwFqEdhU2ZICnUtdiWaCS6UUV3u9
         LW54geZhMjjW+K8lFToxz5o7qvREMfEFnacSV6IR6JUYIbhcSyJgftvP5zYQDr6pF3AR
         zdsTntv3wff77dsp+ixKnMi/ha+AuCNkNoVnog58EcEevbL+BK553In/tmXuJg8LA2bv
         u+G+vjJsdhcG7jVHJr9Pey8ottC6Pmqj1dmKC+HkxscQqpvJu/xZVZ/5hAEKc0JSqXmO
         L7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=rBSzlh/x72GfdteORaJKXLJ+jezy54kOSM/iBbDxwtc=;
        b=wWCdyaaPvw4pA8wwWu6/bBGvcTyLySgj6HQUn7OFgHzAC1f0bS7AbgOmBZzL6/iRqL
         XzPEGwIjvK0naQ0NPdvflZgUHkCseIVXvjdGL9rlwU8VDpPrfvj4KRBDk4DJjZ0lPVTG
         EpnKLrrl8iiTXi14GRv1SWkE4aTf+XaAr/V6/khs7TJo/LoOYROqMGMdQVJosWZJvrsD
         JZjVt7beo1y2o8Pl+K+Ohxyioe1gpUhhxgL4N1XK2MlMSSIDaGzMcu3sRs4rDKhjlJI2
         NfqGBdCmXL81Za2LWDz4JiI8GE25+heNF9uz6yZQu9ROGtLOJ36ZML45Qx69+j2SovtZ
         bKaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w13si579884ljj.2.2019.04.29.01.54.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x3T8sr2D009568
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spoA013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 6/6] x86: ioapic: Simplify ioapic_mask_cell_pins
Date: Mon, 29 Apr 2019 10:54:50 +0200
Message-Id: <d235bde2a4738b4cddb1df926a39b8a1e11c0acc.1556528090.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

After ioapic_get_or_add_phys is called, the shadow_redir_table is
populated with the guest register content. As ioapic_mask_cell_pins is
only called after that function, we can read the mask state from the
shadow table and safe a register access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/ioapic.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
index c257c99e..ee3b77f3 100644
--- a/hypervisor/arch/x86/ioapic.c
+++ b/hypervisor/arch/x86/ioapic.c
@@ -165,19 +165,16 @@ static void ioapic_mask_cell_pins(struct cell_ioapic *ioapic,
 				  enum ioapic_handover handover)
 {
 	struct phys_ioapic *phys_ioapic = ioapic->phys_ioapic;
-	union ioapic_redir_entry entry;
 	unsigned int pin, reg;
 
 	for (pin = 0; pin < phys_ioapic->pins; pin++) {
 		if (!test_bit(pin, (unsigned long *)ioapic->pin_bitmap))
 			continue;
 
-		reg = IOAPIC_REDIR_TBL_START + pin * 2;
-
-		entry.raw[0] = ioapic_reg_read(phys_ioapic, reg);
-		if (entry.remap.mask)
+		if (phys_ioapic->shadow_redir_table[pin].native.mask)
 			continue;
 
+		reg = IOAPIC_REDIR_TBL_START + pin * 2;
 		ioapic_reg_write(phys_ioapic, reg, IOAPIC_REDIR_MASK);
 
 		if (handover == PINS_MASKED)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
