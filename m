Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJ54476AKGQE42LVW4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312E29D245
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:00 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id b23sf305217wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919400; cv=pass;
        d=google.com; s=arc-20160816;
        b=l+JpM8vIy5HR5KNi3Y+NzCg9wKfjXjj4kisebALxDKKlZ/YAw19Gd0tT3l1p7KtL7s
         8tI3VbmB3ThkxAVmH7Ib0xcY9p0YhRCIPA+Nlrp3igQU+SYTSGfhFhjlPNxMiTZnLLb1
         /mRlw9+ehS5W1DhvuQeZgnyvbYtk/XZDk50Ua+61x+9xopHS032QusdRmzZrAK9g5gii
         rFX10ImPA9rJ6XdAtkcZ86GGcyYCBqCfL5HtMnyYtUH3xtXm2NT6EqJtWBQpawxqFGU2
         q34LDLgHmL+p4WPM0Bzx54JBj4dm6uj0tGcasmnCbf2n/03wye7S4aM0tIoHfLEqTA+2
         Mwpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=UJcXwg1GjVAlD9I/6Z7HMP1FQ8dsWvrU2GqAFf5u7Qk=;
        b=I25B1rtRQhsnyWcKTOd8JtrIz+plm1kw9qvt/9Gn20B+xhvSgTxW5ohodd/FisY4Ym
         6Tjg62ktWX0jE46u7V3K1jam0rzEqj1LAPkaB+I3fOqoT6Ds22yHD+rfsCZqDTIb3cF2
         bNrS7qqny7mlWLfnMKcFVBoBjg+IGFQL6g2jZCcSsZmgrONFlYWabKQSorGPPgJYQo8x
         i65B67TBECj1N83NuAQSPaV3ncI3GnIhnnKWgBseaUBiAB8QC0Kv3r70sgnYkPCjtEbM
         O66Exs9OW9gO+o9BPkym4iV7/M+2yY+GbuwIoQ3YBUFlt9+NlryuS0/PIw+fLzHGj1IF
         kOvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1BOXbyZE;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UJcXwg1GjVAlD9I/6Z7HMP1FQ8dsWvrU2GqAFf5u7Qk=;
        b=qW2OMjoy4eDiTGKb+URJtoNHsbj/W8+PTnGjzGvHcGjuPyRbJqPXQKpZ0rNfhM58Wz
         BTVeHTDES3oe96/G/LPamoT5VNEIup85drf0EGvo6//r3kBgdzINlHvjC2Vh7jg+V13R
         6OoRze3VjGvQKW8vLGr5Kl7B+2xpF9eVGnQlqM7icHUHw5XmWMLecFYn7mkgAF/dkTf0
         piQU4fU36M9lWmcb+Xmy6me53uDk5KQNnI113q6sf3rr9DEFV+mzpSiBoVEswNdZtzCD
         7tFcLLsrh6LFJ093aTJOmWAYE/3/wjX8kTugWLIkFQBVVT0AJnRQsADE4mCaz2khtW7Q
         tJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UJcXwg1GjVAlD9I/6Z7HMP1FQ8dsWvrU2GqAFf5u7Qk=;
        b=q+Xe0noSEG0qxfExR5K5zitnVbHAhx+wwa5SPFYbl1/9ooFYojwsmRwd8bR+jKscHu
         OuZ9CCsHpRNJLw9RC0cPVB8JUFEb4WzezJcH0nG9v5cmjNqQyAMLGqBzj/bWDDr05JAi
         DAQ3echrpEN64nJnvaPJSf7CQBTD6pYRFFbwRkJ9xZogmUz/IXEJP0kVICX7KYnm1SDF
         6u/VPwTcnD8jkVFy1OKRTbd299JMR50sB92XBpK/w7AgnzewVaJUu0BzVyFxY7y2crsn
         5Sc/onxkm+j7b/ujLEXtlQg+SkBziiqSffcYDU+ALa4kk2slnII8dpkGkSGgH4LUiCu8
         Rr6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FbLGDH10BTwj4On6Yw8eXxBwIfrEL0w0u0iba7jnBbW7HEXFr
	A1SRtzgeK5QQWCVDUoEcyIQ=
X-Google-Smtp-Source: ABdhPJxbEAaSHUlmrb/gPHx2vZl41gVHECxnlTwa4JkXvLeHvG1VBkrAt6FjCTLxAUjCPdO6iTreCA==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr1554752wrw.132.1603919399893;
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cd12:: with SMTP id f18ls203047wmj.3.canary-gmail; Wed,
 28 Oct 2020 14:09:58 -0700 (PDT)
X-Received: by 2002:a1c:1f87:: with SMTP id f129mr795004wmf.182.1603919398836;
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919398; cv=none;
        d=google.com; s=arc-20160816;
        b=pyIs6s6EDgBrutSKhrjuq5Ie7ZlRhWxklOQIEL8u4pAHX73hjHJlI+zWUhMBU1mlNg
         rLTzm6NKwb9r09SIdwBuQmlXBug9ywGQkRYsHORZG6NdmJvZeGiX6SenXgV6pvwClXbB
         07NwUIYYve5+wgdTTeHgnLD7MC0MIOCWDNjn39BowknDvLxvUNltsjrjOsgSp2IYoQgK
         uv0o+bFNL9bYlSl74ax5lZueySRHryo7hbAsrIMkuXu80CopfZYl5EyPGHNeY0Ok2aKn
         UlD4I/fe1wLChJWwI8t48IF0ToMaZzzcVl48ZAeGUICyQi4LKurZC7ZshnoYwbaWI44J
         ZZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=HzGIbzltYmeMLnzj7MLwKxdbqVvehnWk8W3+m0bZkFM=;
        b=RjLTbE66mvpwuqwVglqBpBt+uMgMAFVAGhBCjU9vs/+Qnutsjv93A3Y2Ue4tcZHAl+
         uPsqfwcEU4RRu8kbIsmKWubXJ1F/SerC85KNSh2SOKjtMGRI4EbIAX6U65P6cRbXxPA9
         2kWksKWAvSmdol3PGcMhhgmOR/9zIYSda01sMChIhT1X93fEV68OZpZ2qQjIKGXA7phB
         F+hcM5dlZhzP03Xdcy/Acw1qrI65gvZkPVKW7M3sQqDtWluxBZWDL2fsVIZNtdg4obfr
         tv/M/lPu1bJQ0wrEzwt3ejak/xqQgcpWwvdzneBWbDJezTLwiZEen/T/CV6Jh5Y07woU
         1T4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1BOXbyZE;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id w6si43071wmk.2.2020.10.28.14.09.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rp41zmzyZ4
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
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
	with LMTP id 4NQ4WpH0O66c for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:58 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rp0x9hzyT0
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 15/22] arm64: smmu: Wsign-compare: make iterator uint
Date: Wed, 28 Oct 2020 22:09:26 +0100
Message-Id: <20201028210933.138379-16-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=1BOXbyZE;       spf=pass
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

Partial fix, Wconversion will complain anyway due to the return int.
Consistently use 'n' for unsigned int iterator.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 41c0ffb4..6a8a46b2 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -370,21 +370,22 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	int i, free_idx = -EINVAL;
+	int free_idx = -EINVAL;
+	unsigned int n;
 
 	/* Stream indexing is blissfully easy */
 	if (!smrs)
 		return id;
 
 	/* Validating SMRs is... less so */
-	for (i = 0; i < smmu->num_mapping_groups; ++i) {
-		if (!smrs[i].valid) {
+	for (n = 0; n < smmu->num_mapping_groups; ++n) {
+		if (!smrs[n].valid) {
 			/*
 			 * Note the first free entry we come across, which
 			 * we'll claim in the end if nothing else matches.
 			 */
 			if (free_idx < 0)
-				free_idx = i;
+				free_idx = n;
 			continue;
 		}
 		/*
@@ -394,16 +395,16 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * expect simply identical entries for this case, but there's
 		 * no harm in accommodating the generalisation.
 		 */
-		if ((smmu->arm_sid_mask & smrs[i].mask) == smmu->arm_sid_mask &&
-		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
-			return i;
+		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
+		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
+			return n;
 		}
 		/*
 		 * If the new entry has any other overlap with an existing one,
 		 * though, then there always exists at least one stream ID
 		 * which would cause a conflict, and we can't allow that risk.
 		 */
-		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | smmu->arm_sid_mask)))
+		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
 			return -EINVAL;
 	}
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-16-andrea.bastoni%40tum.de.
