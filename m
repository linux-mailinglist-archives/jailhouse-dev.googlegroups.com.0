Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVFV2HTAKGQE3MVUL3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A818E7C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:36 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id f41sf1969760ede.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420756; cv=pass;
        d=google.com; s=arc-20160816;
        b=PuZ6ah8Rox/2ANOuVC7mcq1fksKqeE1Cy43j9OMkt3sYUdYpUzuEzFdQ7BWsVT3pRL
         aW5ddOayIpj2aIon04sOIVelmm2Ewj4DsQHEqiTJ63EEJkr/HElIpkz+FRr+/1HI87re
         HZYH0fsvXw2k/uhhOURqj9HPFRr7BSK1FZuS9dy8Gd/69Q7tFsPT0TewWbTerSkmThck
         rvjyenUtTusQ1hKtV2Jb/SpOQxD3B5zCh6ZBwFU9QvI737DDq9f1OYGJtSCqiT4IyLS4
         Ig0QNdIJPx67wOmDrYSMQh4O4qBp0f7Lc/BT7FtzOyWXYOUwDxhlqBG1HnHRhZhPDkOu
         VPgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZIm/4IiO1q5QrDytcV3vUXYNsSK2776YJTWKQ7xHKWg=;
        b=wvAl4dmnqXgP0Fcme0v8KgixDmkLTojuVNMXW4Vxk2/K3oVodvMMwHvvSoExBgNfYR
         3CbNmS8lhW39D2RDMuqJPqR90hmFZTTo97bA/AhgatPp8Q2b8DUMpCQATjatO2onJFPm
         jNfs+QSU3uxuW4g6bFhtA/L3ABZUZ2jnzcnMEH/k9coqWOe34LCcQCcqIKYf+MI7fsjc
         LwjWljBBvDSXANOT1AAVX6pbvPWjs4gyAtqOJPCMvMWqi6MQdjUCAkbVuw5lELuQixNj
         Z7mti+6BdWAg2cUF/wZ9OpMvqgKlUUa7M06VJDWBnKoFXMouNT8ygztVEyeXpbL34T7T
         w+tg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZIm/4IiO1q5QrDytcV3vUXYNsSK2776YJTWKQ7xHKWg=;
        b=liCRYd5sRZs0Q8nDyaYzvW2+qhBT6eHDtJWOHCPhjGAlVRCmYsHeH47AigtKllAI14
         OP6bL7rfwDqqN6TYhbvXUAFKE+Y2SPbMbKH2x//I8Uu3ovrvvyEtYlh3912lHWxKqHZ6
         RplSUlfIfBw3DaWApHSxbn8pUCfzjLtlbMDm5EcYCZ/bbCrQG1kBDmFpQncOkswopLwZ
         zcxkM/5auaZ0O/zA6WimN0cOKsfPg8UDtGmrGJFUd7tIwqMDs6RUUNU2xdzArVTYeRgE
         lUpRjd2lQd1zbnVE76xkWIF2PH00Mc/jeJ8KdQEAlYfViel+gE8x+QNMdK9sZDwR4UpC
         CIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZIm/4IiO1q5QrDytcV3vUXYNsSK2776YJTWKQ7xHKWg=;
        b=KhulD3gOgf1O0c2JIR0rNqLy/kPjW/SYoZbHuktbtot9tw+osuHCiWV+QGVMhDGLTC
         eIuceUpsjUKuBsYks+Ek6HzZersJAJo90XkMU9z7TdHB2sLPfNAlZK6SrPpgfXwLPTFs
         VindVfrp6JM8ajiNR/hfBUdm2KwZJk3Hd1YHi/G4kaQFQ0PgnQH6LZyE0sNS3tjomvEv
         Hq254V+FxxbdZKQZaMI2EcpjCGhDLGMdXPMTCdHPUZKfR+N871dj1ICBtgbFxrX1PfWZ
         ZUKwuiXKPiS7Zhc4tim+ie9TC5XglWCWqBpBye6LRkVKOylFjFic+TpL9ZMsZM571eBB
         wYRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWhuwYOaH/LvvdjpjvEert4a3hx6n/6jSLF26yr9hb2voyXTj81
	piVSHb4/wk1XuNG7MXsdGzo=
X-Google-Smtp-Source: APXvYqzK50i3u1BFbBVh25H+qN4pHdtfFZIYFEHrda/x8uH+QlzpCOL1ReHsMItZPpV30Z0xZv6PfA==
X-Received: by 2002:a17:906:483:: with SMTP id f3mr4218661eja.275.1557420756234;
        Thu, 09 May 2019 09:52:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c50:: with SMTP id t16ls686449ejf.15.gmail; Thu, 09
 May 2019 09:52:35 -0700 (PDT)
X-Received: by 2002:a17:906:ece1:: with SMTP id qt1mr4262253ejb.227.1557420755759;
        Thu, 09 May 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420755; cv=none;
        d=google.com; s=arc-20160816;
        b=IHDvMi1cuJu8U1d0ikWqnosL09jSxZO9g9QKVQ84OSauCJ5rJi4KXuikEUcyIcgXAP
         5rg4LX57gnwebPY6ColoRLktE9uwjfnZbSjUub0twhoqE1OmQthODQQnUnTNNuCrcMNS
         HJG0IpoeJJ3K7CU16Ar5O2gDCnvkLiyfr28Nlks4OZ2G5EDgm8zgUm2Dk6knEw1Ky+iP
         dUbSGgidIvb+GqFzWQzEUY06j7qHUGdgyOso/2TCamRK0sR9zWFW8GzTtT4sT1+l04nS
         fRyjsjGYKZ7WSN5oziF+KBEN2T5sQQdQy+J5sBPVXejCeICtpJXskpGJx6EOT29kOx8R
         3+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=iBxY1PPcSxr828BUu6ZfNt/5Pi9+PwvBBx+P+/bzBY4=;
        b=MQkYV/jBz5tZZNizCItiP6sOfz0oY7E5PyEBieFluqYCS0uiMcRc7jYSFtaCWPBXgm
         /LYu9T5CjzwAzVd5rcDjoq9YWXdsbWBPXWiV2AXnMDdUm4uF/5aJq28vcc1PS/yWyyY3
         B65egu0MElvrCv8ybIiMK3jcHLtl4VTUFJmrvA1AO9qzDRrzJyO8pP1+dBR01ULN9Och
         JXhptsOCvsdBPdBmG2NEtpoDnLDkkl7J56ZdNBAwee9YcuEn4Pzvp2Jlf88naHJ8nKe1
         hgiew0NGqzvlyvmgbEy0owvt3GWns3lMRq32mX40qQ6+SMHHhHBBrrKmmIDiYXWYKWlz
         1hJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id k38si1055364edd.2.2019.05.09.09.52.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC71pF1zyBN;
	Thu,  9 May 2019 18:52:35 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 6/6] pci: use new PCI_CAP_ID_ definitions from pci_defs.h
Date: Thu,  9 May 2019 18:52:31 +0200
Message-Id: <20190509165231.18572-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164517, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

pci.h also defined two IDs for MSI and MSIX. Replace usages of these
definitions with the one defined in pci_defs.h.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/include/jailhouse/pci.h |  3 ---
 hypervisor/ivshmem.c               |  2 +-
 hypervisor/pci.c                   | 26 +++++++++++++-------------
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index 4e744edb..ea8c1a0b 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -35,9 +35,6 @@
 
 #define PCI_DEV_CLASS_OTHER	0xff
 
-#define PCI_CAP_MSI		0x05
-#define PCI_CAP_MSIX		0x11
-
 #define PCI_IVSHMEM_NUM_MMIO_REGIONS	2
 
 struct cell;
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 6c0d5720..53644deb 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -69,7 +69,7 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	[0x34/4] = IVSHMEM_CFG_MSIX_CAP,
 	/* MSI-X capability */
 	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16
-				   | (0x00 << 8) | PCI_CAP_MSIX,
+				   | (0x00 << 8) | PCI_CAP_ID_MSIX,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x4)/4] = 4,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 4,
 };
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index e04d4c58..4ab5fea3 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -240,7 +240,7 @@ enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
 		return PCI_ACCESS_PERFORM;
 
 	cap_offs = address - cap->start;
-	if (cap->id == PCI_CAP_MSI && cap_offs >= 4 &&
+	if (cap->id == PCI_CAP_ID_MSI && cap_offs >= 4 &&
 	    (cap_offs < 10 || (device->info->msi_64bits && cap_offs < 14))) {
 		*value = device->msi_registers.raw[cap_offs / 4] >>
 			((cap_offs % 4) * 8);
@@ -331,7 +331,7 @@ enum pci_access pci_cfg_write_moderate(struct pci_device *device, u16 address,
 		return PCI_ACCESS_REJECT;
 
 	cap_offs = address - cap->start;
-	if (cap->id == PCI_CAP_MSI &&
+	if (cap->id == PCI_CAP_ID_MSI &&
 	    (cap_offs < 10 || (device->info->msi_64bits && cap_offs < 14))) {
 		device->msi_registers.raw[cap_offs / 4] &= ~mask;
 		device->msi_registers.raw[cap_offs / 4] |= value;
@@ -345,7 +345,7 @@ enum pci_access pci_cfg_write_moderate(struct pci_device *device, u16 address,
 		 */
 		if (cap_offs >= 4)
 			return PCI_ACCESS_DONE;
-	} else if (cap->id == PCI_CAP_MSIX && cap_offs < 4) {
+	} else if (cap->id == PCI_CAP_ID_MSIX && cap_offs < 4) {
 		device->msix_registers.raw &= ~mask;
 		device->msix_registers.raw |= value;
 
@@ -527,9 +527,9 @@ void pci_prepare_handover(void)
 		if (!device->cell)
 			continue;
 		for_each_pci_cap(cap, device, n) {
-			if (cap->id == PCI_CAP_MSI)
+			if (cap->id == PCI_CAP_ID_MSI)
 				arch_pci_suppress_msi(device, cap, true);
-			else if (cap->id == PCI_CAP_MSIX)
+			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_suppress_msix(device, cap, true);
 		}
 	}
@@ -556,10 +556,10 @@ void pci_reset_device(struct pci_device *device)
 	pci_write_config(device->info->bdf, PCI_CFG_COMMAND, PCI_CMD_MEM, 2);
 
 	for_each_pci_cap(cap, device, n) {
-		if (cap->id == PCI_CAP_MSI || cap->id == PCI_CAP_MSIX)
+		if (cap->id == PCI_CAP_ID_MSI || cap->id == PCI_CAP_ID_MSIX)
 			/* Disable MSI/MSI-X by clearing the control word. */
 			pci_write_config(device->info->bdf, cap->start+2, 0, 2);
-		if (cap->id == PCI_CAP_MSIX)
+		if (cap->id == PCI_CAP_ID_MSIX)
 			/* Mask each MSI-X vector also physically. */
 			for (n = 0; n < device->info->num_msix_vectors; n++)
 				mmio_write32(&device->msix_table[n].raw[3],
@@ -713,9 +713,9 @@ static int pci_cell_init(struct cell *cell)
 			goto error;
 
 		for_each_pci_cap(cap, device, ncap)
-			if (cap->id == PCI_CAP_MSI)
+			if (cap->id == PCI_CAP_ID_MSI)
 				pci_save_msi(device, cap);
-			else if (cap->id == PCI_CAP_MSIX)
+			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_save_msix(device, cap);
 	}
 
@@ -805,12 +805,12 @@ void pci_config_commit(struct cell *cell_added_removed)
 		if (!device->cell)
 			continue;
 		for_each_pci_cap(cap, device, n) {
-			if (cap->id == PCI_CAP_MSI) {
+			if (cap->id == PCI_CAP_ID_MSI) {
 				err = arch_pci_update_msi(device, cap);
 				if (device->cell == &root_cell)
 					arch_pci_suppress_msi(device, cap,
 							      false);
-			} else if (cap->id == PCI_CAP_MSIX) {
+			} else if (cap->id == PCI_CAP_ID_MSIX) {
 				err = pci_update_msix(device, cap);
 				if (device->cell == &root_cell)
 					pci_suppress_msix(device, cap, false);
@@ -875,9 +875,9 @@ static void pci_shutdown(void)
 			continue;
 
 		for_each_pci_cap(cap, device, n)
-			if (cap->id == PCI_CAP_MSI)
+			if (cap->id == PCI_CAP_ID_MSI)
 				pci_restore_msi(device, cap);
-			else if (cap->id == PCI_CAP_MSIX)
+			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_restore_msix(device, cap);
 
 		if (device->cell != &root_cell)
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-7-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
