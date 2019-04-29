Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXXXTLTAKGQESD4JQGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EEBDE77
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:54 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id n52sf1114290edd.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528094; cv=pass;
        d=google.com; s=arc-20160816;
        b=wZmgkMg9ZQwJLryOk0XjcaxrrexP1MBqatPB0KrUNJMOMjeAi6f5fzvSMzCTAKPo0a
         DtcExSUbgO6z1f/aFjbtsTdG5Nw1vybabkk0kosMrOwayKsuf0KF/AMKMqOOSRT+L2Fs
         IQqxK2SWkg1DWXSIR2rpT6HEDsWsS4/BizJQu6N8+3WDk7TbH/c81Eir2V+FEoV8HQ8y
         nPr6eMv8LeH/otgVnoK5s3k7dQGbOlhDNSEGSOkRseQMR/dk6px9jV+X3B5BDUowSALr
         49Wk3jzaarYEJeCwZXUpcunFKMlkWOG74krils1EbUj7KqwvzwVVohLKAK7eM1aX43k4
         1cTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Nqy/CBpEEict6aplva8e8IlW50mGj0ez1jq/3CZfZ84=;
        b=IT+rw9H+YefD4PIBe4AwLYhBVvizEG8HI6YdEBWXf6lW1gPxQ4NiEfUbl7uV6H+NaV
         Hh6eEKuwuO5IKSStV83Zb7rG0ouPJ1MGtjsdwWJYdqoPDN7ygUHjqbn7qBOaaPlcj6o4
         GsLWwLg77D73d2ATYXsHID9JgQTUZLKDR19Aghe0/st/WgWXXppP1/ZSIYMYy4RkA25Y
         hBGON/gnc30Szcm79PvsuX8LWuNx1hwuijostFvYIt78o8Ns/P6BzwBNI0H1ZV6C2VO4
         TjDoMuWorG2pDTpNjzQUbltESLSPD9jqisQtfN17FwlxScDXIpGsfXkB2fB4YfTp/YD7
         yGWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Nqy/CBpEEict6aplva8e8IlW50mGj0ez1jq/3CZfZ84=;
        b=nj5SbpMpDFiSu8TmtjgmXwa/pBc1IzDsrT0VL1rJAz2PhcgeG02FAjKe4R2pD2wLqm
         BBtANKN52apxa+ickCY2Cvnbn0qTL4icWQSB+G0g6gevdI4jAcnHsmoE3eM9c5or66VW
         tCkiuj9amvWG/HqY8+UEdcQBlgxYjDsHPsJfOPQ/LLBe688GCFvkYT3IQbg9LaV6TaFE
         gsUKcaTAlhHOCmu6aHMYQ5sgB7GIXXSUfaTh8FbwdOkRqi1RAlqkm3zcFen7KIwr0x+M
         0BMQYCxhgeQ0xIjERXe6EYsdZqX/4Lf+m9BxQOF8wg+ZfY0EYEuUN/fSQXk65Et7JI8F
         0k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Nqy/CBpEEict6aplva8e8IlW50mGj0ez1jq/3CZfZ84=;
        b=hchaTE0G/mMDQL7NLWCRr6aTNvHDo1Z8f6yORq0IdJ6cCZtDkRl0gdyJtKg0R2ENDK
         CvUQbuU+0ckd7K88aRGiCMB7/kmb2W5ZDSE8S/740DY9mkC/GJjAjdBdTIHmtfUfa6z3
         8+PuaOAqYYQbcHVmVZYH054KKfMB3WTepG61676FBqYldZtlU0Ijp2inP4U4L2OiF9PW
         YaXJ6XH4HUM/ivE9cePq7929SjMRPRmFWl4MqAvaziomM4R7ZGzw7vn4+ITadfwT88WB
         kXO2vn4+G4X2etE7n4DKSbouZumAI+2WHeXKGngJBel+b/O3vHb4Ts97bFLaHpMcsW1Q
         T7dA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWwN31Xm9qxWoYiY72mB/6OLOHKZ3+d0soRg3EVZa/YwmFiLn8b
	uLcy9kqdUAaxVOCOrbP4CbI=
X-Google-Smtp-Source: APXvYqxH5nWMgE0zwsiPsEgCBf5dHufwqm5cI1+/rwINkitKR8uA9QKF9qPqwE7xeXDFMTjL0FgiEw==
X-Received: by 2002:a17:906:65b:: with SMTP id t27mr30655198ejb.49.1556528094532;
        Mon, 29 Apr 2019 01:54:54 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b495:: with SMTP id w21ls1178804edd.16.gmail; Mon, 29
 Apr 2019 01:54:54 -0700 (PDT)
X-Received: by 2002:a50:aeb6:: with SMTP id e51mr37959980edd.76.1556528093961;
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528093; cv=none;
        d=google.com; s=arc-20160816;
        b=dkSycRdXercwTIrm+aKlTEmIulPESx0L/t+3hS+yS+AZ0UDSmSim5oqSeX3GvY6mGc
         AtryTh1RfputJlIwUzZx7GB0j6XAgUMQhOGzA/Ee3TjfW/FWgLheOzqozGXodPFVQ3f9
         bATB8D5wzUECaW28IzHBgkOLSdKjA80jAjsOk5jnu/3d6KyWxL/jA3a0MxNX/Su3Js8J
         HhvumDMc17IINoTYsY6XnfaeCICMP8UiP+44pF2wpxw0rMfQXRhkVyJ18W/t+6EdNh2R
         DV7NGmJ4IpwY1jpdDY0uSUegR9TpE856VIMLbpukNMGse0Y+jqHr1qdHAqpNIiQ2jz2J
         t+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=dtl70tE7jmiUKxKf9rPiyhDmJ8HWO7iCf3XQw99/hWg=;
        b=JEW0bPzK0+wsE/+B4lSLQOUkN81z0dvsE6t/y/FNejOTYACJtXdwhf3TuWyAO70zhh
         uIGOCicgZjogxZeJaHobHc2Wag9GPunySH57xkYmphyiPD9Z4hDNIZzWFQQBh7gDbtEc
         ch/bN3m+Gs801dw4ADgm2ot6mZLFCIam2p8z/nagUDtf0iLeKFGgPPzvCMweiYhgRQem
         itM47gkToorNSUjGGehFOKGeteO9sNu1XptKfbpYAA1JY7li3vKoe6nPdlu/HtuRZ4pB
         yAlDHBInRLvpgivIbQd8sY9+uo1ki6fF6m09w1YgVIWmWUXV1cfyCP74JmFVKohxGzAK
         lINw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r4si1539733edh.5.2019.04.29.01.54.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x3T8srBt009564
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spo9013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 5/6] x86: ioapic: Move edge interrupt injection at the end of suppression
Date: Mon, 29 Apr 2019 10:54:49 +0200
Message-Id: <cbbb49ef51e6621ecb85fd0af1655ad584e30021.1556528090.git.jan.kiszka@siemens.com>
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

Analogously to MSI: When interrupt remapping is enabled in Linux, we
cannot evaluate the remapping table before the config-commit phase, thus
will never inject a message when trying that earlier.

Fixes: f651754c72e3 ("x86: Virtualize IOAPIC redir table for interrupt remapping support")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/ioapic.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
index 72dd8d90..c257c99e 100644
--- a/hypervisor/arch/x86/ioapic.c
+++ b/hypervisor/arch/x86/ioapic.c
@@ -165,7 +165,6 @@ static void ioapic_mask_cell_pins(struct cell_ioapic *ioapic,
 				  enum ioapic_handover handover)
 {
 	struct phys_ioapic *phys_ioapic = ioapic->phys_ioapic;
-	struct apic_irq_message irq_msg;
 	union ioapic_redir_entry entry;
 	unsigned int pin, reg;
 
@@ -181,20 +180,8 @@ static void ioapic_mask_cell_pins(struct cell_ioapic *ioapic,
 
 		ioapic_reg_write(phys_ioapic, reg, IOAPIC_REDIR_MASK);
 
-		if (handover == PINS_MASKED) {
+		if (handover == PINS_MASKED)
 			phys_ioapic->shadow_redir_table[pin].native.mask = 1;
-		} else if (!entry.native.level_triggered) {
-			/*
-			 * Inject edge-triggered interrupts to avoid losing
-			 * events while masked. Linux can handle rare spurious
-			 * interrupts.
-			 */
-			entry = phys_ioapic->shadow_redir_table[pin];
-			irq_msg = ioapic_translate_redir_entry(ioapic, pin,
-							       entry);
-			if (irq_msg.valid)
-				apic_send_irq(irq_msg);
-		}
 	}
 }
 
@@ -426,6 +413,7 @@ static void ioapic_cell_exit(struct cell *cell)
 
 void ioapic_config_commit(struct cell *cell_added_removed)
 {
+	struct apic_irq_message irq_msg;
 	union ioapic_redir_entry entry;
 	struct cell_ioapic *ioapic;
 	unsigned int pin, reg, n;
@@ -451,6 +439,20 @@ void ioapic_config_commit(struct cell *cell_added_removed)
 					     "state, pin %d\n", pin);
 				panic_stop();
 			}
+
+			if (cell_added_removed != &root_cell ||
+			    entry.native.level_triggered)
+				continue;
+
+			/*
+			 * Inject edge-triggered interrupts to avoid losing
+			 * events while suppressed (masked). Linux can handle
+			 * rare spurious interrupts.
+			 */
+			irq_msg = ioapic_translate_redir_entry(ioapic, pin,
+							       entry);
+			if (irq_msg.valid)
+				apic_send_irq(irq_msg);
 		}
 }
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
