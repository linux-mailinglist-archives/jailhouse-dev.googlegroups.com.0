Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVUXYXVAKGQEOZ4OGMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662D89C80
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 13:21:59 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id b33sf64240192edc.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 04:21:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565608918; cv=pass;
        d=google.com; s=arc-20160816;
        b=yOULYOtooMBq0MVFsjQ0SLCamf0DEeyNiR6SHFzAh+stczBUD9EBEHd0lh6cZLcPPz
         Y4i/zs4Pyaxx4lvBlTRueDzbIn8ij9wquooRFCthRBEFgol3IMTXZtFtn46S6lN16W/q
         SvK345CTxHTmkSgZ8oF66Ht+N8sAiC6JHe61VBAza1jfeh+MSC82NWhHWFR7EM5vBsgR
         Dyg0TyleR1PO3weC2mTFF7M/w8jNtt3o5xgvi2CzF3jBgzBC3GhZcdGOuiTWB94VTUyX
         +f+SEF+CVT9Wa+wkF5FveYD8q9G7O+J70bOFm5XkR1C64f6FfcorPcBM/qecOi0kEWta
         5swA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=mVSIpTLnR2J2OjSy+TRTRk6S+OKKbZJ6yHLFOkQzDxc=;
        b=htot1B1lF6CV30SAgl8MJvrtPADsGiCBX3U1qu1Y/ykePsouL2q2AXmWiBq1Lp1G6o
         uKK+IZhBqgdo3OMMiPsPMvMIn8OTUm06mXOrLaO97Vg863uXyRpvTnZhaFJEJ4BDnuPe
         HmDzleEUepYvRj7qEJ/WwooZa/64pqvxb1xD0fhvJA5QkMApM0v1pjW41cJ1MROBBu+5
         vbY95pX160LwPjR39D8EMPo4PnvVPgFmOdK7/hQqZhg/Xba6xw4BZhEk8ZMnzfvlhZlZ
         zpeJ1VThs0pJLwSIVlglPXsmI4hvMYcePmF/Xr3ls4EcQ/oZb2I+LVMUJe/jw5RzmdUA
         edsw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mVSIpTLnR2J2OjSy+TRTRk6S+OKKbZJ6yHLFOkQzDxc=;
        b=pcgf4kbeO9JMnC9NMz8npvHoQv2rELcFz1r7+IQxde59RY3Gs3VFeqohdQjsEmD+FP
         pKqOS6wZp1O6Cj9gfM60kNwdGx0VAbYFXnt1QKZqGCr9MO59CA/04V/q/PUfWidABPr6
         /i8hfEXvQ2LU6MzNYUsPir1cVgfxyLHvAVf4vx4jaW2zG5VmM0UBkod6e/nRINSgKNnw
         OjWypV6u7egDuA0HLrGZZiVAu6xRuwxSOhrsnL+Ma34Zyh1N2/BZuAhISsBGaV/pZdm8
         7i4cXyc8/s9+vIrLa/Ah1wwu63spSjuY/VP3cKyITi2tDvalRkS1g4N5akdZszvGcXpk
         UK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mVSIpTLnR2J2OjSy+TRTRk6S+OKKbZJ6yHLFOkQzDxc=;
        b=ELdCl/FHit0vbBgNNEG0RX1sf4uA+Mr87VyPu2CgLzfYEJta9GKn34torPFM0pE7tc
         uOMDJA4HrA0tIqeB8c+dHxFWptoFfgvHyDSHTiwiokkI1G/NYO+/hWSLREhfxWBqQu/U
         1FkEBWYKP+jqt2NJIjc+RNFE60DtWasRiUzief2ZaiAmNSn3rNTpx8o6FwVXBnm/3OEc
         fpLOZeAb1MVcbpEus59T5uqetEUKx1GLY0iFIhPnlCWhU5g3PjfsUnuJBs9IBAxtI363
         EEouGN7FMoodw80YZYN1Gm03dkWVbKrcXRXSLzIudugYcosxlBVo6FBqbfWP3Cj73BI9
         PfVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXYxR2yjPacPymgg0i5D3f4luFc337lIh1fHqowOhuO8DkxVK5i
	1iliUKg6USZOPS7YvsH5orw=
X-Google-Smtp-Source: APXvYqxY1MuAcnQwSlbY8jlbdfRIH6vZV7ZgZGe5P6XUUeer2oTgZ9IYqEhboXTREISYAx4KOdxRWw==
X-Received: by 2002:a17:906:6582:: with SMTP id x2mr31209692ejn.2.1565608918799;
        Mon, 12 Aug 2019 04:21:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:3d8:: with SMTP id t24ls306917edw.10.gmail; Mon, 12
 Aug 2019 04:21:58 -0700 (PDT)
X-Received: by 2002:a50:eac6:: with SMTP id u6mr35912539edp.83.1565608918215;
        Mon, 12 Aug 2019 04:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565608918; cv=none;
        d=google.com; s=arc-20160816;
        b=cTQ6mG7HltGXX/lcPspw05bTThH2/3eRsWsklHrmR3V2b2M/PTKL52a17YXYcCRXFa
         IVmzd1km/Gw9/70dbhVv7TY3zv9HL6c/21NTgNPLeUND9xOLfzBgdRxpueRQ22OaziPG
         iIIWF/pnalTa6nMBAI7DbzMzN3rPSE4XAZtggrhkYt0IfqdgXRIvmECTfEAIsgpijxC+
         zcAdnLQK44EeAv7T8TsN28qt2AJ6x+ozxnR/8tDB+03lNaWEH6gUpnTMLIYcRKjMTkg6
         6QrPulruBAO2g3zBwdmqDq1o9Y6HGrUOR89NgK3UKbYSAvVddpNb1aZuMMOF8hjFdjJC
         bzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=5YL2tMocAxkmX2Mb5KaGxmoBWeSZOS5iAXQyGLsmRJ8=;
        b=RWM9pV1wgmkKBn4pC7vPFPw/u27glstDPm+TdS1J9o9+6Ii3MQt+eJsSNd6u42benq
         4OhrJAzGzhtVuptwXg9KcLaUJgmaZC0x7UbUrb2UqAm+efbkcdtIOTztbNGFoQI/ViXB
         ZQpVXBVNc5JZCK41OSdWVebPpbxEC8VAGBcFDBRF0RE4x6CAUrfSjHdwvKIW4Mt6r8Lx
         kQGBnacrsO2U6hfENM7fg0ljfO3Kb7GldOPueeZeIFEW7CYdT8Pgm7+N8dCb2UTyvmya
         DhQ5N4rhV04IWR0tGDxItfveA8W/mPZ8B9p7ujNT9YNMoDgj/EY3ZdxBb//DJJAlYB0H
         aaHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s30si2658279eda.4.2019.08.12.04.21.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 04:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 466YMn249Qzy5p;
	Mon, 12 Aug 2019 13:21:57 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jslaby@suse.com>,
	linux-serial@vger.kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jay Dolan <jay.dolan@accesio.com>
Subject: [PATCH] serial: 8250_pci: Implement MSI(-X) support
Date: Mon, 12 Aug 2019 13:21:52 +0200
Message-Id: <20190812112152.693622-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.12.110917, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.8.12.5630000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

There may be setups, where legacy interrupts are not available. This is
the caese, e.g., when Linux runs as guest (aka. non-root cell) of the
partitioning hypervisor Jailhouse. There, only MSI(-X) interrupts are
available for guests.

But the 8250_pci driver currently only supports legacy ints. So let's
enable MSI(-X) interrupts.

Nevertheless, this needs to handled with care: while many 8250 devices
actually claim to support MSI(-X) interrupts it should not be enabled be
default. I had at least one device in my hands with broken MSI
implementation.

So better introduce a whitelist with devices that are known to support
MSI(-X) interrupts. I tested all devices mentioned in the patch.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 drivers/tty/serial/8250/8250_pci.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
index bbe5cba21522..97992884c0ee 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -53,6 +53,16 @@ struct serial_private {
 	int			line[0];
 };
 
+static const struct pci_device_id pci_use_msi[] = {
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_NETMOS, PCI_DEVICE_ID_NETMOS_9900,
+			 0xA000, 0x1000) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_NETMOS, PCI_DEVICE_ID_NETMOS_9912,
+			 0xA000, 0x1000) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_NETMOS, PCI_DEVICE_ID_NETMOS_9922,
+			 0xA000, 0x1000) },
+	{ }
+};
+
 static int pci_default_setup(struct serial_private*,
 	  const struct pciserial_board*, struct uart_8250_port *, int);
 
@@ -3643,7 +3653,22 @@ pciserial_init_ports(struct pci_dev *dev, const struct pciserial_board *board)
 	memset(&uart, 0, sizeof(uart));
 	uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
 	uart.port.uartclk = board->base_baud * 16;
-	uart.port.irq = get_pci_irq(dev, board);
+
+	if (pci_match_id(pci_use_msi, dev)) {
+		dev_dbg(&dev->dev, "Using MSI(-X) interrupts\n");
+		pci_set_master(dev);
+		rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
+	} else {
+		dev_dbg(&dev->dev, "Using legacy interrupts\n");
+		rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_LEGACY);
+	}
+	if (rc < 0) {
+		kfree(priv);
+		priv = ERR_PTR(rc);
+		goto err_deinit;
+	}
+
+	uart.port.irq = pci_irq_vector(dev, 0);
 	uart.port.dev = &dev->dev;
 
 	for (i = 0; i < nr_ports; i++) {
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190812112152.693622-1-ralf.ramsauer%40oth-regensburg.de.
