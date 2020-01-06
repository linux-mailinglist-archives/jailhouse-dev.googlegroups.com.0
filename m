Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5GLZTYAKGQE472SQ7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 71916131202
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:05 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id d21sf3955404edy.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313205; cv=pass;
        d=google.com; s=arc-20160816;
        b=P/FMRg6lvh/vF12bVaxVTN5i8QOivNKGxG6gIL6xuxjvtTCnIRV+4lN21oG8P2CNmy
         nihEa6OrOLYXZyuAazVZ3yREpVIVAMG3SAtZ8GJZ6XD9RTB4L4GJ2nISUX42FoCYv+DU
         stNYf0SdBmSE7v+gPxo04ZI7AjetZOWYaWgC8VLtV5mafUiRexo+OBWxp0x/PaBSCdhJ
         +GlJAGdLZC20Vf9QHyrcT5cjpbnlZBMcxKYUYcBF6pKQRUwW8Mp4/Mjajk3sIksZXaVG
         ZFgKZ1itdaHY4OlA0SEnXUL7+bXXNTRRKzyPUxadAe8WegyAWEdSRC6umffb5rLch/BY
         GOpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=2FUTWphUrulgyPD1v02VGyOPtL/YAdMAzjXTPgqodAA=;
        b=ngsjNx0FdOPzeKkR5xDqixQ/3SF6g1Rld05YdPwzfAPiCsTmnprU0eDYCKY4APZfJY
         Dc7EOEWImeW71hhFyD1D3NsUN6opsPYa2aiY+/dl3pQtQENqpzGagl6hae3+3DGTF1Nl
         XNFNgtJHbxk69XWFtru9wlftDYVFZV2g0PTO5k2ZJ+cAulOIKxVoWKVrC+F/4Pmzn+mu
         Mr4swUmENCIqcKQf1rFh69X5wOlN0ODjckLsIKRsFY9p2w5mkYmF/+Dww3JyPP5k8kFO
         JbJnup1G7pwrhDomJHBahXXIou/4eVjmXP8SfzS0eyuO0nDuA3RNtjKpaCwOW485KyXE
         hyIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2FUTWphUrulgyPD1v02VGyOPtL/YAdMAzjXTPgqodAA=;
        b=mFLxBsDaps60L+czrDieXKdKPVillOjLwrwyGwUKjeGnNAqFkcBdc6X6q7F/zl4Uul
         eaZhRrge8svtZvb1TlRT5M44Ovui8QvUrEueMMWPrQ0ldvyPXN26a1XyEZ/LS8lq0Bk5
         yhvYdG8HRMYl6wU7f/J9NWCy0W0ixErzFAUhrbBHUmc3EO6Q4fpS9kO0XgotQ1Zzd8xi
         yqSDB51B7GjdXIvvJVf4hoeCuLurITg7wfRBwnb4i0PaBHwmIlBeltMPe4ozkfdlaHhu
         C57D2VLnW9R1aLm7e7ayz9HbSzPlBEo9WiDzeE/nN2xER0d15LIfPGsj9ZFBmU6QJx4F
         hP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2FUTWphUrulgyPD1v02VGyOPtL/YAdMAzjXTPgqodAA=;
        b=infw0GwcdLtVV+SjOAq+oYgt35uc4f2w2COXmL5f62LI95wmA6gkPtSMZLsrDBdpIH
         htVFLpGSHc3MdVProndesvLjRlVuXosVI3kTvcgkBRKrfGlMwbBPniehkCMTuuepr3WZ
         cdOPtMgXNBKGJF3uWVap6XQ+A4wtsS/nASuqdr8i7sqoapi/3lQJdxtxg5z7Kpj76qBq
         vxmhgtZQzzcWJEIYp4brdIW1TpetBsPG01Smfxi9/uXe6z/Z8OYZ29o3Z1BouvXQ3/A/
         zwCU0OSyBl+EXmcC1G4BU0s3Ar+BeurvaXupLKWXH+P4KBzlhIQLcJZJGoGVsuR/mVHH
         WdMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVc8a67NDhoEQy9XXBiNXVXs1F4nMbAW7+vdr1c9nu1gW6hrhdf
	ri4+Ac3p1XfifoN/7xvTzi4=
X-Google-Smtp-Source: APXvYqyzg6kmltQrCQAI4KoYrh3cbXNqGt35pLnWpG8OE/0JrhPrE1ZA5o4bRHTO64VuEVvhPBo/gg==
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr108553080edx.157.1578313205092;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bb47:: with SMTP id y65ls14008132ede.1.gmail; Mon, 06
 Jan 2020 04:20:04 -0800 (PST)
X-Received: by 2002:a05:6402:22cf:: with SMTP id dm15mr107808951edb.233.1578313204349;
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313204; cv=none;
        d=google.com; s=arc-20160816;
        b=L+kV4okNSpVqzl1X9ejpM2g2BYKb6asFE+ULoncOdJdDnT3BV62ZtsRDjdD0dibRL2
         VtcuWqgWgm7SPguXiNXr9mj6ZthKIc2R7CTLGadPNr+9wJw2xy0Q+UBh6vvskVclPSxi
         6i1QwyCl64lcpYR75xvfQONPEzb91AC31i7bCyjI8SCTTWP3xkDXiDzi1CpghawAbFTI
         tg056mmsOSFhyfbQi4kNiApV3/wvf3oZ7wHbdbvaIZ4547jX/bEq/JQD6exAqyQw6Jzo
         98Dz6CP8EoIAqshw/t3X+bmg1sTZH6GPtAI55wgeINxQx7PF0J3h3b+F9nPntqJFjhSN
         Jvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=n8TTlrCOVYZg9Lh/NLRgZD62/kjKYXK+7Wam++AgLXA=;
        b=FDhehghVc5b+uo6g5Y7SVLLMx81znKqZrr45QZRC7Wnbx4lU98nlVNzAmgdYMfPJrG
         WIk9AoyXFVpAcjcLX3tTUZ+oDhnaBmWgguQrnFazDsaD+b/9szrjAcBYxlEQGqqvyVLd
         WXBl/rMxW+rGPgu6SzdBplCXGVur1g+RRtMBATrA7amZUhfFbhFJHvpIj5G+7ugQtaDe
         bkQgOJsgDA/u7BffvqXzo+3P6hh2KTyAUIIrMbq62Gi4Qt1UmQ7XBh3zJGy7xatzDsmA
         ZxoKQX9XVqlsdViT/uWqJ/68aoUX6vS0xLEwCKa6xP0X1kFI9i2vP13KUrxgqgeh+0Y/
         C9OQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x18si2237412eds.2.2020.01.06.04.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK4nc021232
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF6029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 32/38] core: ivshmem: Add one-shot interrupt mode
Date: Mon,  6 Jan 2020 13:18:13 +0100
Message-Id: <289dc628d6a55f57ae86ee23486a3ead62087115.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Add a control flag to the vendor capability that allows to switch
interrupt delivery into a one-shot mode: If enabled, the interrupt
control register is reset after each delivery.

This feature is useful for guests that want to throttle the delivery of
ivshmem interrupts to unprivileged users. The most prominent example is
the UIO framework of Linux. It receives interrupts of UIO devices in the
kernel on behalf of the user process, disables further events and
signals the arrival to the process. That one has to re-enable interrupts
in the device. Thus, it's scheduling naturally throttles the interrupt
arrival rate. With ivshmem, this procedure requires two VM exits per
interrupts when only using the related control register. With the
one-shot mode, one exit can be avoided.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index a7c8aeae..7e376e4e 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -43,6 +43,8 @@
 #define IVSHMEM_CFG_SHMEM_ADDR		(IVSHMEM_CFG_VNDR_CAP + 0x18)
 #define IVSHMEM_CFG_VNDR_LEN		0x20
 
+#define IVSHMEM_CFG_ONESHOT_INT		(1 << 24)
+
 /*
  * Make the region two times as large as the MSI-X table to guarantee a
  * power-of-2 size (encoding constraint of a BAR).
@@ -86,8 +88,13 @@ static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 	 */
 	spin_lock(&ive->irq_lock);
 
-	if (ive->int_ctrl_reg & IVSHMEM_INT_ENABLE)
+	if (ive->int_ctrl_reg & IVSHMEM_INT_ENABLE) {
+		if (ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &
+		    IVSHMEM_CFG_ONESHOT_INT)
+			ive->int_ctrl_reg = 0;
+
 		arch_ivshmem_trigger_interrupt(ive, vector);
+	}
 
 	spin_unlock(&ive->irq_lock);
 }
@@ -338,6 +345,12 @@ enum pci_access ivshmem_pci_cfg_write(struct pci_device *device,
 			value & PCI_MSIX_CTRL_RW_MASK;
 		if (ivshmem_update_msix(device))
 			return PCI_ACCESS_REJECT;
+		break;
+	case IVSHMEM_CFG_VNDR_CAP / 4:
+		ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &= ~IVSHMEM_CFG_ONESHOT_INT;
+		ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] |=
+			value & IVSHMEM_CFG_ONESHOT_INT;
+		break;
 	}
 	return PCI_ACCESS_DONE;
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/289dc628d6a55f57ae86ee23486a3ead62087115.1578313099.git.jan.kiszka%40siemens.com.
