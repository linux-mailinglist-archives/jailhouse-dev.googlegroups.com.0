Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIO3YHUAKGQEP37D6LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFE50246
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:28:49 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id c27sf18953630edn.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561357729; cv=pass;
        d=google.com; s=arc-20160816;
        b=BEfFN7q6xG3dLmdKhGWBUjDMCd399L/FgZ4k6j5GukZluJwhnTz5/n7kxQ3HtunqPC
         8KLC8M4d5noSRNN4evL00nj7BSZEoyi3/f2LbZ6hS/QJ6V4QA5MRVoai8ubzQRX+14aJ
         2dW241JOK0gAk7C5HUIu99+Yn6E2jLKnu5osMUe9YydI7sC0IJ/E1CH+6TrUkSKjSbor
         wPoSUQZPxJ7IIQdUSYksJlOX4ovnVbD1Ect5dP59Ik5zE9I1rP/lAotnBXDQsUKhqsDh
         MfiVvjoLCgKTvlyJshbPRn9XYj4pxA/njmbHrXeWicc6+/TKeZ8vo11yTbXFUzy9rULW
         4OqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=UAokAbHeaaKIxq+mX/KIm+m0rhQxBy7sui7namensEU=;
        b=xAK+jSidBCmL3EIVi3d3cELeebn7790Fxu5SzjRAPjB763t8NcpSKF63lNJ1H1nmQ4
         5VDq6I2NqPkdy0oVOm+dfQ197PehUl7ZUYdYLnjKZ/gWw3wB4geiCARoTYhzqKaOvmVH
         nuplbj5VRtPpN/gBwOTJb0m13hb3xbF9dO/Gog6sZkS+96Tgjcscip/b4wT5fdqosBMW
         V1wJWq5hZTRrb3o7p9LrhZUYY9FN7xhTIpuDmx1DNgpyDuOixRVpdoY2qFDUxxEzp4Mt
         3Gco98n0eWxDe9kORLO6B7TcJQ5ewMfeEUq5oqZ9cV6xqld6DxUC7vdnwwFSY+H8RrBN
         cHPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UAokAbHeaaKIxq+mX/KIm+m0rhQxBy7sui7namensEU=;
        b=dERWgjENgpjHr7P4EewRbMe3FoT8hUqsLPh7glXhLAWAAAy/sJ4/ulyquG90cyCDls
         t0ceODz6TcYIhUIH8aZX6M9v1Ia8N0Gk35KcVzUj/TDUzb0Q1xNY5THUU7JwpSQITCIo
         2TTEUcLoJ8eT3Na97Je6Q6Nw63HHqZqcRTotBW+TF/ddLOkj5kvBIiIFdP4PsFs561iD
         faG3sS34nNLqIUsMhAL3dFdpiofxCG10mhJGy7jXHkuPXzXqGn1XS1d496jq0leeguQt
         KV6koG6VTB716z3SRhA99FwbJNEltKw3+Zj0YfYMQVWHOhmS7T4HJgkQYDSF1VQ0zO52
         2Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UAokAbHeaaKIxq+mX/KIm+m0rhQxBy7sui7namensEU=;
        b=T37yTwZLRR7uFF7ckqjIZJKU755GBc3Otc23D+xEq/smklzKf59ON7BDQPu28Oz1c6
         6sewKJ+XoVDP1x6CU0BjyCvPTAbGrUUWMROoQ+3a9/a1xbxAqi+8dQh5Ozwy85mzSQlT
         9N3ylfMWRCAxCDmOH067iF/CuduBi1ZjdPRkm017i1eHboyvMQyxzG/qw+uusrCUzEbW
         ZWc+1zfVa/tfd2v9SzEWeQyhWXBkiGkvBP5+uBPpnzJJMgKyAB0D9Bcn+LfF0AXkGc50
         DfgUjEwjmEvu1OL3P+90P/+/P9ouY2rbYJqtpTtA7BfWhtOJ67/Ifg3U0vPkJRNOA/wL
         9B7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVafAgM3mdOHc9jQ8kvIOdhw80qlRtfYUOQjeNat9qBJocpo0By
	cLEXGPJr66h0ird6J4Xmx+s=
X-Google-Smtp-Source: APXvYqwt+7KtbNjZKYqN0pZDgXCf6b4x/VohPtY6znioSllrTNxXUO/K82vFxeMwdcgyOBIDzcnNUA==
X-Received: by 2002:a17:907:20ed:: with SMTP id rh13mr29015869ejb.34.1561357729578;
        Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ac62:: with SMTP id w31ls4727672edc.10.gmail; Sun, 23
 Jun 2019 23:28:49 -0700 (PDT)
X-Received: by 2002:a05:6402:1658:: with SMTP id s24mr96863812edx.288.1561357729030;
        Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561357729; cv=none;
        d=google.com; s=arc-20160816;
        b=nJC4ZYwlXTGjbRZulIm5kVrV9dSZaca+UmAoKdQUbDqtUDojroGyoVC73re1Ylh+HM
         ntQgNNPAWrjqs8qPSiB+mF3iY7LKb1ucHtHZPxnKIZBTHQ4A/0+YvY16kods4rDWnnxz
         WWk3ArJo7RJp/l6x5VQnTAw+IVdz7sId8v8IrqFZ6ixK4/V/6LT/z7Ij4aRDUvkvd0mp
         AYbUvlKnWusuyjFoCFuA4aq5hmbDuDe6toLLwvkeUpcfw377YAGs+ohiu4hqTV4mexmW
         CaHd9LpaZ8Pma5Iq1gw8RCQkdrWjzlsJpxyAAeFyJqAnqOEvioU3jpiGrYCzTVnvG1cP
         R5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=5Ie3Urir9d3vVcGioqZC9Mm2dyoxravBwgFzpwcHO30=;
        b=tYrsK3Ld4Vy2dZ6/JEXh+KzARKavWs6LfiXoZam3J2DjmUNWUqZbcl0/c69UDvlf8r
         Rk0oYc60YDoxFw7wNjMyqvkFbDU1PtZilC/RQ5RGPPEgjJp3p1bbcgopif1uwx3extk6
         Dms2G560k0sfYUKGEXFGqlCkwOxR5VreqtWpIS2gGfNLJA764H49euqV1NWOBBGWGZJn
         LEW2hQeo9WwceN6U0e4PagMm9aQRpi6h/tZUx3Lg+tsoKqT6VrXYOMa1ZKcSXWDEX8DY
         vpxpFFR0hRNWKKnphreMswlPkVGXtPHby/6EbWt4AKVx3emPKtiCUfkmZcC1Mul789v/
         dsMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h23si847437edb.2.2019.06.23.23.28.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5O6Sm4U032650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:48 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5O6SjUZ030166
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:47 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/3] x86: pci: Do not inject masked MSI vectors on handover
Date: Mon, 24 Jun 2019 08:28:42 +0200
Message-Id: <243a7537af27a963c00e936462b705dcde7cb970.1561357723.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Recent Linux versions initialize MSI with a placeholder vector,
MANAGED_IRQ_SHUTDOWN_VECTOR, but keep them masked. As we ignored the
mask so far, we injected this vector on handover. That caused and
spurious interrupt warning and, worse, blocking of vectors with equal or
lower priority because Linux does not ack unused vectors anymore (an
issue of its own).

We can avoid the issue by evaluating the mask state, if any, prior to
injection.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index 560c5697..0cbb2f3d 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -289,6 +289,7 @@ void arch_pci_suppress_msi(struct pci_device *device,
 	unsigned int n, vectors = pci_enabled_msi_vectors(device);
 	const struct jailhouse_pci_device *info = device->info;
 	struct apic_irq_message irq_msg;
+	unsigned int mask_pos, mask = 0;
 	union x86_msi_vector msi = {
 		.native.dest_logical = 1,
 		.native.redir_hint = 1,
@@ -312,11 +313,15 @@ void arch_pci_suppress_msi(struct pci_device *device,
 		 * Inject MSI vectors to avoid losing events while suppressed.
 		 * Linux can handle rare spurious interrupts.
 		 */
+		if (info->msi_maskable) {
+			mask_pos = cap->start + (info->msi_64bits ? 0x10 : 0xc);
+			mask = pci_read_config(info->bdf, mask_pos, 4);
+		}
 		msi = pci_get_x86_msi_vector(device);
 		for (n = 0; n < vectors; n++) {
 			irq_msg = x86_pci_translate_msi(device, n, vectors,
 							msi);
-			if (irq_msg.valid)
+			if ((mask & (1 << n)) == 0 && irq_msg.valid)
 				apic_send_irq(irq_msg);
 		}
 	}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/243a7537af27a963c00e936462b705dcde7cb970.1561357723.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
