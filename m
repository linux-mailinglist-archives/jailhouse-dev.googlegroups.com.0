Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXD3PWAKGQER4C3MYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 91718CB4DB
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 09:16:07 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id c23sf3325065edb.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 00:16:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570173367; cv=pass;
        d=google.com; s=arc-20160816;
        b=jHbfOg71qmHY2pP/oNR07B80JZNFETwFC79g+JCHJWITJUKiBK3SNexzbsDOT1/IW9
         3u6+vqJlFRIUelLB2XnDt2tdMGseL7jIy+cMhCf+BmK1Mq6AIY/rW+obRz/alYPDUl3G
         CMOE88UIZieU/YNnPbTTukG2nhzjUSzanljJJ5rn4g43l8CEj1/kibhfGHbpNjWZ4f1r
         rtdFvU6dIHbhreLYg8r1+CD5TKfeO21yT6eNjvq3wgjb6p6MYkRkMpK/h7SA+KsEGM0p
         cBGwwZtqSfXUekakU7V8MW65RDVFRStCu+xxFV8ydCHmFafWC+ATyzP2ebzCSJJCNrEb
         Gjug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=zatmwxJJ4BbwEI6z5U0ZclsTHG4Gr3ndZ8r21jdl+VI=;
        b=cYl4hrvulyMfXuwcog+/6xziqH3cIcqV3rZCOBOafDdArgf52nZa+h/oUHTZfEAHBG
         aqSw5hwKTC4UfOO0rov3N5znkJ7Pej+GtqF5JqEi9vJaOLq2kW4TDVjWb98Ek0mj4nl0
         +XfwOMrRSMNG22ydvaeAf9mzf66iGfdpTm9Fpz9UTy6tTOd1dPNomQbIMnXLatawBHFj
         TOlFz0oC3SmGlqTbN4oF8SDo7ANoQxT5YLTyMCS3azF+naxNuAfYq77YXhQ9hkADjODl
         RnLOFqXfHwI3ni3azgrENINgaynGZv5RbZ1wPmRTjLGBgwB7yLeXxinOAS1G6ym4DDFZ
         crqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zatmwxJJ4BbwEI6z5U0ZclsTHG4Gr3ndZ8r21jdl+VI=;
        b=j2JZrZLJmjhxArjBPlty2d1Odas1bpXffRC1sct409NUskmwe/SPyjSmf5h+J+ZuBe
         HUBGhafENFbtfRtDg+ctGF/3L6m7leP4nsets0JJcBY3eClxRa3Kt3y8j5zEloL+2nwT
         5v5PRkNo2pKOJEuwSOzpz+wpX/3NlAwFacdQHUmNwNogKZZXXvNVKAa9rL8yqQwaGOB7
         zL+XtvyvZvKUcPVf3VaFxDuCAUtkeM+94A7X7RQW9Prjqv7jkJfimOtUJWHDtR7Y81Gd
         5fg+DqVauE/KvWAaSZvdJS6ETet1TWQaZkY2Uug4OPT7CbBCW1AN+RnbCC4UCKjVyOyf
         UR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zatmwxJJ4BbwEI6z5U0ZclsTHG4Gr3ndZ8r21jdl+VI=;
        b=MCR/JH76LYHC9TruOGeehqDBV2IJcKf+6NJ9Q0tyoKwKQmJQYBovs5Wz9NVg1i1y06
         5pCzkliRjG4X+fUSyqOjOQ836ZlomXS7o3Tvp74vuhUJ6ea6R5lSC7ogvVtkCTye8t0P
         FaGFmi6kr6p0EZo4T9XDcp8SzP2E9E/0RKZk8Etxmm8/UsRh2RbldEI0cmd9N7TR41J7
         la0/4f0G2X5aEfWO/G2pwT2IPtOfzR3LsHNJgT+sC5hrLkDJgAVf5zIVwqH9vz2LkmbO
         JbFMxFPlU8xIvphbHToRpjXaWmqnBJPpGR2NWk7ZkcCMndLE+QzjiYF4fFfTH0xSIqmL
         bOwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWQ51s2VXix1GbJATmNKvI07tQqvbsZvpRVet+6Ksgpr7vx2crS
	eUGNh2PfZ2Wo8MRJkIAPgm0=
X-Google-Smtp-Source: APXvYqwNa1Slm7EIWFhQDnxB2HBwFrn9hcL0KfOxmXvytkAfkaM0Mjyd+D3RocdPHvzn6b9m/BXZLQ==
X-Received: by 2002:a50:f0d4:: with SMTP id a20mr14025005edm.149.1570173367257;
        Fri, 04 Oct 2019 00:16:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:b02:: with SMTP id bm2ls2162848edb.5.gmail; Fri, 04
 Oct 2019 00:16:06 -0700 (PDT)
X-Received: by 2002:a50:ed82:: with SMTP id h2mr13767283edr.206.1570173366164;
        Fri, 04 Oct 2019 00:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570173366; cv=none;
        d=google.com; s=arc-20160816;
        b=OHtX9dWtaJOoxdh3o6pbuRiXD1YluCufcuY2ZyRzVrYGczWg96aKTsPABcVMVEwIVg
         qn7Suh/IWAJdCsqGjipNuRNU4j7L0LS0wawmmupEKAX5/NQ4ZjNy6lWiAZT1sPRY6q2B
         9m1VaMOrXqrLHyuArW5jYVg4O48RlQSaIU9YKWgQ1WtUxds8aH5dRB+7IdATE3NXLkVd
         Q+y2rZ8HFJnAb+fSjycwNkldE5v5p5BcuMj/Pv4uOz46oCm/4ES22koaZA+pIM97o9fh
         nmJK1QFNaVjljoXf/RjXAULmn/J8oJRhuavYvbVqaN/eLynlbWt/AWOO8WsANW/ePRFr
         pXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=69wKZeRSj/DRNoxwL2Bynyz/0+jqdgtXzon5hDdrDL8=;
        b=RxJtgcyPlxm8uGCVLvRR8oJZuYvgTZCQPPEWwCLpio8olmEICGL+7hIGqDF9b4dhPM
         POXAXlVxQcDjxXw+q6asCI2aU2we93Enm3vGsMx+mCNDOhv+kvuTIwpZiLOg8eh1tPqA
         gJUfgg+J7RO+8/B1/Q01+8uOS7FDkJxBbo3tkciQWABr4IEL9V3VQZv/IBPZr2wusKlr
         LEM1mdMxzop+YlWDfXX5C9dYQPwXTKUy8oa7ZrtrmdlUbotFcw1dwl9fTSD48BGrotPv
         ZdlTx7OSOZdSMKwbEy0SxYiCgSaU+qY4MDNi4v5AXb8B0Hfy3c5Svdb+bRqfOu1rvLFc
         aBtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q8si463204edn.5.2019.10.04.00.16.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 00:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x947G5WA005965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Oct 2019 09:16:05 +0200
Received: from [139.22.119.224] (md1y04tc.ad001.siemens.net [139.22.119.224] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x947G5SH003369
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Oct 2019 09:16:05 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] x86: apic: Add full support for IPI shorthands
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <07e21aa6-dffb-00e5-ef14-64df483cd4dd@siemens.com>
Date: Fri, 4 Oct 2019 09:16:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Adding this enables support for Linux kernel 5.4 which starts to use the
shorthands. And it actually simplifies things as we can drop the
shorthand validation and fold apic_valid_ipi_mode into its caller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c | 51 ++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index de691329..d0142b1c 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -343,33 +343,6 @@ void apic_clear(void)
 	apic_ops.write(APIC_REG_SVR, 0xff);
 }
 
-static bool apic_valid_ipi_mode(u32 lo_val)
-{
-	switch (lo_val & APIC_ICR_DLVR_MASK) {
-	case APIC_ICR_DLVR_INIT:
-	case APIC_ICR_DLVR_FIXED:
-	case APIC_ICR_DLVR_LOWPRI:
-	case APIC_ICR_DLVR_NMI:
-	case APIC_ICR_DLVR_SIPI:
-		break;
-	default:
-		panic_printk("FATAL: Unsupported APIC delivery mode, "
-			     "ICR.lo=%x\n", lo_val);
-		return false;
-	}
-
-	switch (lo_val & APIC_ICR_SH_MASK) {
-	case APIC_ICR_SH_NONE:
-	case APIC_ICR_SH_SELF:
-		break;
-	default:
-		panic_printk("FATAL: Unsupported shorthand, ICR.lo=%x\n",
-			     lo_val);
-		return false;
-	}
-	return true;
-}
-
 static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,
 			  u32 icr_lo)
 {
@@ -441,15 +414,35 @@ static bool apic_handle_icr_write(u32 lo_val, u32 hi_val)
 {
 	unsigned int target_cpu_id;
 
-	if (!apic_valid_ipi_mode(lo_val))
+	switch (lo_val & APIC_ICR_DLVR_MASK) {
+	case APIC_ICR_DLVR_INIT:
+	case APIC_ICR_DLVR_FIXED:
+	case APIC_ICR_DLVR_LOWPRI:
+	case APIC_ICR_DLVR_NMI:
+	case APIC_ICR_DLVR_SIPI:
+		break;
+	default:
+		panic_printk("FATAL: Unsupported APIC delivery mode, "
+			     "ICR.lo=%x\n", lo_val);
 		return false;
+	}
 
-	if ((lo_val & APIC_ICR_SH_MASK) == APIC_ICR_SH_SELF) {
+	switch (lo_val & APIC_ICR_SH_MASK) {
+	case APIC_ICR_SH_SELF:
 		apic_ops.write(APIC_REG_ICR, (lo_val & APIC_ICR_VECTOR_MASK) |
 					     APIC_ICR_DLVR_FIXED |
 					     APIC_ICR_TM_EDGE |
 					     APIC_ICR_SH_SELF);
 		return true;
+	case APIC_ICR_SH_ALL:
+		for_each_cpu(target_cpu_id, this_cell()->cpu_set)
+			apic_send_ipi(target_cpu_id, hi_val, lo_val);
+		return true;
+	case APIC_ICR_SH_ALLOTHER:
+		for_each_cpu_except(target_cpu_id, this_cell()->cpu_set,
+				    this_cpu_id())
+			apic_send_ipi(target_cpu_id, hi_val, lo_val);
+		return true;
 	}
 
 	if (lo_val & APIC_ICR_DEST_LOGICAL) {
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/07e21aa6-dffb-00e5-ef14-64df483cd4dd%40siemens.com.
