Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPXTLTAKGQEKZELSBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CCBDE76
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:54 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id v7sf460179lje.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528093; cv=pass;
        d=google.com; s=arc-20160816;
        b=lr2zOVlxRHRYSPUSQrOqDo7siO1+mfif7dD4EDJWT8hvT8YVave2sCjR0b7KajEygZ
         +9M4nf6ns+y1ecmf5iyzmRXnxXt4XJh2GXCdaMrlbmY8qQ+eS/osWgyhd4UO37L2/f11
         HuQU0I8ukZRH9TxLPYK8zax4guQ5LpcnMb0kdcsbxEITcaZgOMu9yYA49KFfPMRBybzB
         2IPW5G9hJIy6NcD9V7eqMqHMKyBwWu/jrPC4IxaXAfb+yZezbDuuHWI36ZQbFl8wkLri
         QBbypBpFYT0RUmDcLpP/7jStoeTgKtMZMEjHQ66Fdak5SV3Yxc9UWqSRfeRa+pOqj5Fy
         ZEVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Px6QAp8wYcCdGXpEvdxIUwpoDEPcvsWatikAeQnNzNY=;
        b=Je6LWeyh6sq23w+Gt/itmpQEmn0YdysxxGR4zAk3ZWwB7bgluut9cnq4NgSARNULML
         EtwljRBnEAfycVCP8CqPxmL8ESTHbIS5DcBIN9vVfEeiBDOYUqtuITQZul1tQ8o9icba
         syjWPNBzVk9G4ia8/KAxlciuHUHp3o4czzNDyFyl5jJPRAjypsocpDDPAk86XG9yD5HR
         gqwn6aKiPaP8Sp4407Cf7JwUX/rCMx4npC1MS3pOn7IfAcTZ5qkuYGOPJQceAPZIzytE
         24z0xK3MecwOg+DO0nLP2eVNAUq4FubObgwui4RRYFoAGUEnr9B84GsctIzrcYK+9Imz
         +2bQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Px6QAp8wYcCdGXpEvdxIUwpoDEPcvsWatikAeQnNzNY=;
        b=qtVL0TgjY304Z0FMC1GiHJEBxkNZQEGcd4HM1dlKkrrifX9QlwJF47fklQeFsOCdsP
         ECgoRH7XZUN3cNj2a/ayY8Gr6l5zkSRpv9epSGHF37DDLcPm23mtBEyc1yACWFPDfMh7
         VUaOraU6MwzcJkl56wpIsK0xhC9hiBkPXEXU9I3njrGDmRh4GhZsLaj1PcWF/Un0rKgR
         2lQY4cinD74O3+gEEFVDA3RBUoUSCw6HCZRxm4AjDtVehDuajn+YiNUR3ykG3hAjMOFu
         qbiQtsRWiEoDe/LqLFmI91jufatZZCLY/p6RaJJXTJESGgl2E7xNFgUPjG1e3ckyBjd9
         a5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Px6QAp8wYcCdGXpEvdxIUwpoDEPcvsWatikAeQnNzNY=;
        b=Pj66JFXzcb8+xJbufcqAePFYG4rRq6GQAgxnRNxWwU/cpDo+E3x1pNa/BpD0gYgjee
         3F8r7u08qZBlRknv1rMeoQAt/nXVDP/UpBAzXPj2i85IpVFmn0nrkH4jhgUu5fi6WVj3
         GJUNlCgzoljSqLE28tIJMu7Mf2yVlTP8TPEAdblm5p/+jxuXIYf1KOHusei3U3uvAht9
         N5nJTNATIs/0nULmAY8pRdGDuxtnlQxTZSwDwp3NFolgtjdvAIbNViho7pbK9fntaI5X
         FpkXatuv3aHM2q1XH1c+glhzxie9NuDF9QN9vUCpZ/buWSnG3sd7b6ALJe5T7lEh6Xk2
         Ezhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWcUJ29BVDncZP2nJAeVSTEuZYT9QmThkVUaP+NoUijZPatVhiH
	06XpaRsy1Ex0Ygl9zqjNS4k=
X-Google-Smtp-Source: APXvYqzHfrmZGGFC32TzA3Xc+UVrSc2KqGBSpEK48KgO0uSiV+MlSH/90TUxprnrCGluOdet5TR8hA==
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr8030101lfg.133.1556528093637;
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:974e:: with SMTP id f14ls869109ljj.15.gmail; Mon, 29 Apr
 2019 01:54:53 -0700 (PDT)
X-Received: by 2002:a2e:9b96:: with SMTP id z22mr21200151lji.165.1556528092967;
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528092; cv=none;
        d=google.com; s=arc-20160816;
        b=EGTQHg01nRJVuGSAmlPYO7H3pDIe+0hSeJcDGzojLcGpFEB+miKC3pg1t3RcwQkaVs
         EtAe9ySthdFxcTN5BIHVKiJqRFBl9Uxp6UErNhdYdMgOeKyDoh9KJqroRld5nAhFSs8B
         J9IoO5th18ZWnYhuK3GqyC52JqJdzdtbzp2XC0bryDgNmNPgTQOQwdDxGP893+YKqycg
         FfYq+rlG/IMGOGNRn78jjgGZ69Qt0HDQPcuzWcLBBGAZnI5P3NKu1cHMV3PKuat91eGc
         Q/NfyiXeorUFWMgYx4iC/GR4AXGwxFppaDT0yOA1dfp41o32Kh6ldzR5OMdtWiYIXHK7
         OcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=9Jc9wrQLruHiql1xLXV2Kx+SMDOFXmQ29T9oI/sY6K8=;
        b=Q8sCtBGzeK4vOM4vZuft8QZA6Ni53rwh/PeBRDln/dS7OjvzziHIP+gAlHYlks2K52
         A+ts8pc0GlF6K9wsm/D2k3T2NHxWDZMcpseGTJKdUZQAtdiQ+yVAzr/XxYUf1zIiRKAu
         5vPKZ6XhflIGoBAyhmpM5SZ1CSu/jqm252At+TbA+0SVGSlpm/MTvo/y0lUaMbWVM2we
         0Ni9D9vSjAC/qf2Rr0kkcXZk+ywQ2ajuROUZ8L79xKpWPeisMLKy1r7cXB17EISSIHSg
         AHK2m/hg0Kcke/8n5ioJycoAgT1VQ/fy0CI1kktE1Fz1K0oNfnjo0tdEwO9zr9u8JCzq
         b+ew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v89si1226449lje.4.2019.04.29.01.54.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3T8sqbK005008
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spo5013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/6] pci: Refactor loops in pci_prepare_handover and pci_config_commit
Date: Mon, 29 Apr 2019 10:54:45 +0200
Message-Id: <49de7b7e47e6a997941c1f45453c249c31537a49.1556528090.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

No functional change, just reduction of indention which will also be
beneficial for upcoming changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/pci.c | 50 ++++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index b083be4f..000ee29f 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -524,13 +524,14 @@ void pci_prepare_handover(void)
 		return;
 
 	for_each_configured_pci_device(device, &root_cell) {
-		if (device->cell)
-			for_each_pci_cap(cap, device, n) {
-				if (cap->id == PCI_CAP_MSI)
-					arch_pci_suppress_msi(device, cap);
-				else if (cap->id == PCI_CAP_MSIX)
-					pci_suppress_msix(device, cap, true);
-			}
+		if (!device->cell)
+			continue;
+		for_each_pci_cap(cap, device, n) {
+			if (cap->id == PCI_CAP_MSI)
+				arch_pci_suppress_msi(device, cap);
+			else if (cap->id == PCI_CAP_MSIX)
+				pci_suppress_msix(device, cap, true);
+		}
 	}
 }
 
@@ -800,26 +801,27 @@ void pci_config_commit(struct cell *cell_added_removed)
 	if (!cell_added_removed)
 		return;
 
-	for_each_configured_pci_device(device, &root_cell)
-		if (device->cell) {
-			for_each_pci_cap(cap, device, n) {
-				if (cap->id == PCI_CAP_MSI) {
-					err = arch_pci_update_msi(device, cap);
-				} else if (cap->id == PCI_CAP_MSIX) {
-					err = pci_update_msix(device, cap);
-					pci_suppress_msix(device, cap, false);
-				}
-				if (err)
-					goto error;
+	for_each_configured_pci_device(device, &root_cell) {
+		if (!device->cell)
+			continue;
+		for_each_pci_cap(cap, device, n) {
+			if (cap->id == PCI_CAP_MSI) {
+				err = arch_pci_update_msi(device, cap);
+			} else if (cap->id == PCI_CAP_MSIX) {
+				err = pci_update_msix(device, cap);
+				pci_suppress_msix(device, cap, false);
 			}
-			if (device->info->type == JAILHOUSE_PCI_TYPE_IVSHMEM) {
-				err = arch_ivshmem_update_msix(device);
-				if (err) {
-					cap = NULL;
-					goto error;
-				}
+			if (err)
+				goto error;
+		}
+		if (device->info->type == JAILHOUSE_PCI_TYPE_IVSHMEM) {
+			err = arch_ivshmem_update_msix(device);
+			if (err) {
+				cap = NULL;
+				goto error;
 			}
 		}
+	}
 	return;
 
 error:
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
