Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRB5HZR6MAMGQEECK3FPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43d.google.com (mail-pf1-x43d.google.com [IPv6:2607:f8b0:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB259CB49
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Aug 2022 00:02:30 +0200 (CEST)
Received: by mail-pf1-x43d.google.com with SMTP id cg5-20020a056a00290500b0053511889856sf5058086pfb.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Aug 2022 15:02:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661205749; cv=pass;
        d=google.com; s=arc-20160816;
        b=O4CVvs0ekTz9nj7OlJzvQBxAGHhNqYfz2HVLq2ZWVqMNPWvef7sA/NUScYGyz1pH2n
         7fiDQb/sx2kJgrr9z7k+7Eacoy5E7huEcS3BUhuHlNfkaZeeowZqUvV8ZnhpWoDIfTmN
         xcIrjmjrSjtHN3HjbGmkT/Z9X6dcIyDgDctKCFZ/xqCR2oyOh6vQdQCFIlt6SPnQkLgW
         7FkKsFgxHvO8FLA2P2SsFGnkgKVx0RIxsoMF6QvhvFVuBLHyFKtzau8A7yBNxA50rwkj
         g15eXks0hNuFBFOKBPsxmhka3MkGBVX5bwDjNpztF4J1Lv16vLu0SMIZ+FsPyI3ik8SS
         HkGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=jG3njM38Ac/CjrY824hZ6jSlw0CzfKiHaxe7wmuLHks=;
        b=kddAsUBPalYAMNRqZ/hQmkSduGE1EVGZuYC6w8ox2HMMHvEu/TLNDX9aBxyrUfhXKj
         b6X3DOi0BaGFG0915lQPoOUYjKUhFhuJpxJVzkBeGFZzoaA8bboRxdtqAPaJbWl4QlVh
         YeQRGzJmxidrl3sMkf4hGOg/jD3M7t62zGLA2rcI9XVpuNPc4wN+KiG0CcwUV0AYIXkP
         QOY8BJQTqRRs8bo70dltm67EEQr9Wp/m7+X61Z/8GuAUGR+Q6A8SRQ8hbrgHQ5n+Hm9W
         P8pGckmUiFIz3S6F7RenZaV5elHYOlr46Fv/Xdez7zINO3U9quFs0A+4QO99kBbSxio1
         LePg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:references:in-reply-to:message-id:date:subject:cc
         :to:from:mime-version:sender:from:to:cc;
        bh=jG3njM38Ac/CjrY824hZ6jSlw0CzfKiHaxe7wmuLHks=;
        b=bJRM0d5k/5/yaygpupyt9ZX99WLA23QbI7JzMEHa8ak/4at7QtGugZ2EpzrIW0emE3
         /zNPNGk6X9mPAy7SJlH5z3qGkW3tXOih2xDK4xk6zts6JdChSxqn6OJKSeXRYQwpaLbQ
         +pvavzYKRdmoU1c5hwVfyhppgXCdpAB6CTIGEzXMprhCcInP1lp6EW87V4eeU5o+DNHa
         CSEF/QzNXZTbrKZ9jIENKekZwSz+dfVhgrsYSjSDj7BHpa84RglJjV3FrKgPIWL1AJV2
         wzr38NCFDoandu6sA18ddHCrwck6lCojFtiDAaju/RxHOe5BZGoTFJy3aL3IYKeVuEIG
         sYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version
         :x-gm-message-state:sender:from:to:cc;
        bh=jG3njM38Ac/CjrY824hZ6jSlw0CzfKiHaxe7wmuLHks=;
        b=2sYBbco4GhaLHYj5xo17R+LFb4j35wjDct5bp9Bed15e+2kWC+TbGUSboCPXw+ANcJ
         NCOVo0xgpb0KZL4YS5eciGl3Y39luqnXUMVdIcxpGx97DHXHkW9Dwd6xrs2Z2UqQBlmc
         tZc65DpeiEa8kpmTlUN/S4G5+63jbJII/9M25ETWnmrQPtaD14YRqTZMb12Turraj4BF
         O+ZHpg0DZauHfhQY6o51j0NhE2ja8fflkIMruBjQPzjZENIFuxzJ/Fj4RaQmBVsC/LeQ
         fh1BIyMAB+1JKLgh/OZ+zTjUhh+q/Uo9gJwwebUaygdBhJA51LUlkNm/GxJ+mwW0IfmS
         D3Fg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo0mn+TmbucDrQibRk2cQWpcdcLNHUWZHnLzufzXsfpjxsxiBz39
	ZGyJVChHX6Svb/vLk2PWsHM=
X-Google-Smtp-Source: AA6agR4ba0yu1nIMXHpYUhIk8+wW1vHHq0a5sOb7UNWkeItKkMRM4/xbNUo/OPMiEyzQNSJqJnhFTA==
X-Received: by 2002:a05:6a00:1345:b0:536:d73a:4392 with SMTP id k5-20020a056a00134500b00536d73a4392mr3282560pfu.6.1661205749274;
        Mon, 22 Aug 2022 15:02:29 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:eac4:b0:1fa:cffd:9d32 with SMTP id
 ev4-20020a17090aeac400b001facffd9d32ls15466pjb.2.-pod-preprod-gmail; Mon, 22
 Aug 2022 15:02:28 -0700 (PDT)
X-Received: by 2002:a17:902:f684:b0:172:d54d:6f9e with SMTP id l4-20020a170902f68400b00172d54d6f9emr12063537plg.174.1661205748143;
        Mon, 22 Aug 2022 15:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661205748; cv=none;
        d=google.com; s=arc-20160816;
        b=vokjfnDMRG2GCUUvfXCtKjNFOr5dkU9qwgZCuADRTzuoTUokfyvaSx2bPtXZgPgoxY
         FTeevR4bicFySQiqNyYcgzv4MxucPPv7SKDg/P1bxfzrj3+yorlke6/f5Pv0KeaLNWd5
         NKmbaj/uZZKXcM0N6V0+Sb+dN21pfOaXHNLAn3MpwY/xnX3mVQTKlltC+0JGKAvaTuZL
         v1XsKQDdSTT8Y6JGV9wBvGuahGNmblHbZV4eSGowkCWAtyJqSKfvEI/5TQd5/TWS9vwj
         pcgDCjYHbXaAT5dfKoZHD9J7HjOugVKmlUhVVpZd+22+CofKGpP3PnFLwlMtyP6NWd3I
         dZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=2nM8gM+pf+P217sv1OW89TBUTtksjuFIka/f2q/Ywt0=;
        b=QLxws9s22ZhezMebRT2YSGp1fi4uPMHq6+3bAFc8/Xb/VEfC9UJmWYwS1utmH8T6jX
         FpTJI5undzke4hClENvNqbVGLwJ7Ffri1QfC8744W1SNd48GLD1/oTIlkA7zCcHKhXDL
         lvCmnQJGZPvRtixRQ88EMtAJaqFrb3o/ndCmGdIm5KE10tfaC0Uu5o94q2BEVFyYdMVD
         oDTAVBffFsvvRC2Wwc27aOvco43ImfrXgXtjwYi9T4eku6C/BC9JZkKH2WWtRrVbeJvA
         s/MHtFePcAVs0ddiv6cgXFPA0+na+Z9Kxj+QM/K/o2ocA73EXY2zGY1wB/zn1GQrrbJh
         ngbw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id q19-20020a638c53000000b00423291dc756si497650pgn.5.2022.08.22.15.02.27
        for <jailhouse-dev@googlegroups.com>;
        Mon, 22 Aug 2022 15:02:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.93,255,1654527600"; 
   d="scan'208";a="130222644"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2022 07:02:27 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 23C6040078A9;
	Tue, 23 Aug 2022 07:02:24 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] configs: arm64: Add root cell config for Renesas RZ/G2M SoC
Date: Mon, 22 Aug 2022 23:02:01 +0100
Message-Id: <20220822220202.26218-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Original-Sender: prabhakar.mahadev-lad.rj@bp.renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates
 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
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

Add root cell config for Renesas RZ/G2M SoC based on Renesas BSP-3.0.0 [0]
(5.10 kernel).

Tested on HopeRun HiHope RZ/G2M platform [1].

[0] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 configs/arm64/renesas-r8a774a1.c | 1134 ++++++++++++++++++++++++++++++
 1 file changed, 1134 insertions(+)
 create mode 100644 configs/arm64/renesas-r8a774a1.c

diff --git a/configs/arm64/renesas-r8a774a1.c b/configs/arm64/renesas-r8a774a1.c
new file mode 100644
index 00000000..1d51c829
--- /dev/null
+++ b/configs/arm64/renesas-r8a774a1.c
@@ -0,0 +1,1134 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for HopeRun HiHope RZ/G2M platform
+ * based on R8A774A1/R8A774A3
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[148];
+	struct jailhouse_irqchip irqchips[4];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x88000000,
+			.size =       0x1000000,
+		},
+		.debug_console = {
+			.address = 0xe6e88000,
+			.size = 0x40,
+			.type = JAILHOUSE_CON_TYPE_SCIF,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0xf1010000,
+				.gicc_base = 0xf102f000,
+				.gich_base = 0xf1040000,
+				.gicv_base = 0xf106f000,
+				.maintenance_irq = 25,
+			}
+		},
+		.root_cell = {
+			.name = "Renesas HopeRun HiHope RZ/G2M",
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+		},
+	},
+
+	.cpus = {
+		0x3f,
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0x48000000,
+			.virt_start = 0x48000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Leave hole for hypervisor */
+		/* RAM - reserved for baremetal apps */ {
+			.phys_start = 0x89000000,
+			.virt_start = 0x89000000,
+			.size = 0x6400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM - reserved for inmate */ {
+			.phys_start = 0x8f400000,
+			.virt_start = 0x8f400000,
+			.size = 0x19c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0xa9000000,
+			.virt_start = 0xa9000000,
+			.size = 0x17000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM */ {
+			.phys_start = 0x600000000,
+			.virt_start = 0x600000000,
+			.size = 0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* QOS */ {
+			.phys_start = 0xe67e0000,
+			.virt_start = 0xe67e0000,
+			.size = 0x10090,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* RWDT */ {
+			.phys_start = 0xe6020000,
+			.virt_start = 0xe6020000,
+			.size = 0x0c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO0 */ {
+			.phys_start = 0xe6050000,
+			.virt_start = 0xe6050000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO1 */ {
+			.phys_start = 0xe6051000,
+			.virt_start = 0xe6051000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO2 */ {
+			.phys_start = 0xe6052000,
+			.virt_start = 0xe6052000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO3 */ {
+			.phys_start = 0xe6053000,
+			.virt_start = 0xe6053000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO4 */ {
+			.phys_start = 0xe6054000,
+			.virt_start = 0xe6054000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO5 */ {
+			.phys_start = 0xe6055000,
+			.virt_start = 0xe6055000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO6 */ {
+			.phys_start = 0xe6055400,
+			.virt_start = 0xe6055400,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO7 */ {
+			.phys_start = 0xe6055800,
+			.virt_start = 0xe6055800,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PFC */ {
+			.phys_start = 0xe6060000,
+			.virt_start = 0xe6060000,
+			.size = 0x50c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT0 */ {
+			.phys_start = 0xe60f0000,
+			.virt_start = 0xe60f0000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT1 */ {
+			.phys_start = 0xe6130000,
+			.virt_start = 0xe6130000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT2 */ {
+			.phys_start = 0xe6140000,
+			.virt_start = 0xe6140000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT3 */ {
+			.phys_start = 0xe6148000,
+			.virt_start = 0xe6148000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CPG */ {
+			.phys_start = 0xe6150000,
+			.virt_start = 0xe6150000,
+			.size = 0x0bb0,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* RST */ {
+			.phys_start = 0xe6160000,
+			.virt_start = 0xe6160000,
+			.size = 0x018c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SYSC */ {
+			.phys_start = 0xe6180000,
+			.virt_start = 0xe6180000,
+			.size = 0x0400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TSC */ {
+			.phys_start = 0xe6198000,
+			.virt_start = 0xe6198000,
+			.size = 0x0100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TSC */ {
+			.phys_start = 0xe61a0000,
+			.virt_start = 0xe61a0000,
+			.size = 0x0100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TSC */ {
+			.phys_start = 0xe61a8000,
+			.virt_start = 0xe61a8000,
+			.size = 0x0100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* INTC EX */ {
+			.phys_start = 0xe61c0000,
+			.virt_start = 0xe61c0000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU0 */ {
+			.phys_start = 0xe61e0000,
+			.virt_start = 0xe61e0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU1 */ {
+			.phys_start = 0xe6fc0000,
+			.virt_start = 0xe6fc0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU2 */ {
+			.phys_start = 0xe6fd0000,
+			.virt_start = 0xe6fd0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU3 */ {
+			.phys_start = 0xe6fe0000,
+			.virt_start = 0xe6fe0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU4 */ {
+			.phys_start = 0xffc00000,
+			.virt_start = 0xffc00000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C0 */ {
+			.phys_start = 0xe6500000,
+			.virt_start = 0xe6500000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C1 */ {
+			.phys_start = 0xe6508000,
+			.virt_start = 0xe6508000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C2 */ {
+			.phys_start = 0xe6510000,
+			.virt_start = 0xe6510000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C3 */ {
+			.phys_start = 0xe66d0000,
+			.virt_start = 0xe66d0000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C4 */ {
+			.phys_start = 0xe66d8000,
+			.virt_start = 0xe66d8000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C5 */ {
+			.phys_start = 0xe66e0000,
+			.virt_start = 0xe66e0000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C6 */ {
+			.phys_start = 0xe66e8000,
+			.virt_start = 0xe66e8000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C DVFS */ {
+			.phys_start = 0xe60b0000,
+			.virt_start = 0xe60b0000,
+			.size = 0x425,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF0 */ {
+			.phys_start = 0xe6540000,
+			.virt_start = 0xe6540000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF1 */ {
+			.phys_start = 0xe6550000,
+			.virt_start = 0xe6550000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF2 */ {
+			.phys_start = 0xe6560000,
+			.virt_start = 0xe6560000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF3 */ {
+			.phys_start = 0xe66a0000,
+			.virt_start = 0xe66a0000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF4 */ {
+			.phys_start = 0xe66b0000,
+			.virt_start = 0xe66b0000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSUSB */ {
+			.phys_start = 0xe6590000,
+			.virt_start = 0xe6590000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB2 CLKSEL */ {
+			.phys_start = 0xe6590630,
+			.virt_start = 0xe6590630,
+			.size = 0x2,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 |
+				JAILHOUSE_MEM_IO_32 |JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB DMAC0 */ {
+			.phys_start = 0xe65a0000,
+			.virt_start = 0xe65a0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB DMAC1 */ {
+			.phys_start = 0xe65b0000,
+			.virt_start = 0xe65b0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB3 PHY */ {
+			.phys_start = 0xe65ee000,
+			.virt_start = 0xe65ee000,
+			.size = 0x90,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DMAC0 */ {
+			.phys_start = 0xe6700000,
+			.virt_start = 0xe6700000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DMAC1 */ {
+			.phys_start = 0xe7300000,
+			.virt_start = 0xe7300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DMAC2 */ {
+			.phys_start = 0xe7310000,
+			.virt_start = 0xe7310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU DS0 */ {
+			.phys_start = 0xe6740000,
+			.virt_start = 0xe6740000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU DS1 */ {
+			.phys_start = 0xe7740000,
+			.virt_start = 0xe7740000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU HC */ {
+			.phys_start = 0xe6570000,
+			.virt_start = 0xe6570000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU MM */ {
+			.phys_start = 0xe67b0000,
+			.virt_start = 0xe67b0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU MP */ {
+			.phys_start = 0xec670000,
+			.virt_start = 0xec670000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU PV0 */ {
+			.phys_start = 0xfd800000,
+			.virt_start = 0xfd800000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU PV1 */ {
+			.phys_start = 0xfd950000,
+			.virt_start = 0xfd950000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU VC0 */ {
+			.phys_start = 0xfe6b0000,
+			.virt_start = 0xfe6b0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU VI0 */ {
+			.phys_start = 0xfebd0000,
+			.virt_start = 0xfebd0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* AVB */ {
+			.phys_start = 0xe6800000,
+			.virt_start = 0xe6800000,
+			.size = 0x800,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CAN0 */ {
+			.phys_start = 0xe6c30000,
+			.virt_start = 0xe6c30000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CAN1 */ {
+			.phys_start = 0xe6c38000,
+			.virt_start = 0xe6c38000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CANFD */ {
+			.phys_start = 0xe66c0000,
+			.virt_start = 0xe66c0000,
+			.size = 0x8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM0 */ {
+			.phys_start = 0xe6e30000,
+			.virt_start = 0xe6e30000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM1 */ {
+			.phys_start = 0xe6e31000,
+			.virt_start = 0xe6e31000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM2 */ {
+			.phys_start = 0xe6e32000,
+			.virt_start = 0xe6e32000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM3 */ {
+			.phys_start = 0xe6e33000,
+			.virt_start = 0xe6e33000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM4 */ {
+			.phys_start = 0xe6e34000,
+			.virt_start = 0xe6e34000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM5 */ {
+			.phys_start = 0xe6e35000,
+			.virt_start = 0xe6e35000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM6 */ {
+			.phys_start = 0xe6e36000,
+			.virt_start = 0xe6e36000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TPU */ {
+			.phys_start = 0xe6e80000,
+			.virt_start = 0xe6e80000,
+			.size = 0x148,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF0 */ {
+			.phys_start = 0xe6e60000,
+			.virt_start = 0xe6e60000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF1 */ {
+			.phys_start = 0xe6e68000,
+			.virt_start = 0xe6e68000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF2 */ {
+			.phys_start = 0xe6e88000,
+			.virt_start = 0xe6e88000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF3 */ {
+			.phys_start = 0xe6c50000,
+			.virt_start = 0xe6c50000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF4 */ {
+			.phys_start = 0xe6c40000,
+			.virt_start = 0xe6c40000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF5 */ {
+			.phys_start = 0xe6f30000,
+			.virt_start = 0xe6f30000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF0 */ {
+			.phys_start = 0xe6e90000,
+			.virt_start = 0xe6e90000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF1 */ {
+			.phys_start = 0xe6ea0000,
+			.virt_start = 0xe6ea0000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF2 */ {
+			.phys_start = 0xe6c00000,
+			.virt_start = 0xe6c00000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF3 */ {
+			.phys_start = 0xe6c10000,
+			.virt_start = 0xe6c10000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN0 */ {
+			.phys_start = 0xe6ef0000,
+			.virt_start = 0xe6ef0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN1 */ {
+			.phys_start = 0xe6ef1000,
+			.virt_start = 0xe6ef1000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN2 */ {
+			.phys_start = 0xe6ef2000,
+			.virt_start = 0xe6ef2000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN3 */ {
+			.phys_start = 0xe6ef3000,
+			.virt_start = 0xe6ef3000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN4 */ {
+			.phys_start = 0xe6ef4000,
+			.virt_start = 0xe6ef4000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN5 */ {
+			.phys_start = 0xe6ef5000,
+			.virt_start = 0xe6ef5000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN6 */ {
+			.phys_start = 0xe6ef6000,
+			.virt_start = 0xe6ef6000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN7 */ {
+			.phys_start = 0xe6ef7000,
+			.virt_start = 0xe6ef7000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec500000,
+			.virt_start = 0xec500000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec5a0000,
+			.virt_start = 0xec5a0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec540000,
+			.virt_start = 0xec540000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec541000,
+			.virt_start = 0xec541000,
+			.size = 0x280,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec760000,
+			.virt_start = 0xec760000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* AUDMA0 */ {
+			.phys_start = 0xec700000,
+			.virt_start = 0xec700000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* AUDMA1 */ {
+			.phys_start = 0xec720000,
+			.virt_start = 0xec720000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* XHCI0 */ {
+			.phys_start = 0xee000000,
+			.virt_start = 0xee000000,
+			.size = 0xc00,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB3 PERI */ {
+			.phys_start = 0xee020000,
+			.virt_start = 0xee020000,
+			.size = 0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* OHCI0 */ {
+			.phys_start = 0xee080000,
+			.virt_start = 0xee080000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* OHCI1 */ {
+			.phys_start = 0xee0a0000,
+			.virt_start = 0xee0a0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* EHCI0 */ {
+			.phys_start = 0xee080100,
+			.virt_start = 0xee080100,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* EHCI1 */ {
+			.phys_start = 0xee0a0100,
+			.virt_start = 0xee0a0100,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB2 PHY0 */ {
+			.phys_start = 0xee080200,
+			.virt_start = 0xee080200,
+			.size = 0x700,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB2 PHY1 */ {
+			.phys_start = 0xee0a0200,
+			.virt_start = 0xee0a0200,
+			.size = 0x700,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI0 */ {
+			.phys_start = 0xee100000,
+			.virt_start = 0xee100000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI1 */ {
+			.phys_start = 0xee120000,
+			.virt_start = 0xee120000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI2 */ {
+			.phys_start = 0xee140000,
+			.virt_start = 0xee140000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI3 */ {
+			.phys_start = 0xee160000,
+			.virt_start = 0xee160000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GSX */ {
+			.phys_start = 0xfd000000,
+			.virt_start = 0xfd000000,
+			.size = 0x40000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0xfe100000,
+			.virt_start = 0xfe100000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0xfe200000,
+			.virt_start = 0xfe200000,
+			.size = 0x200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0x30000000,
+			.virt_start = 0x30000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0x38000000,
+			.virt_start = 0x38000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xee800000,
+			.virt_start = 0xee800000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xee900000,
+			.virt_start = 0xee900000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xeea00000,
+			.virt_start = 0xeea00000,
+			.size = 0x200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xc8000000,
+			.virt_start = 0xc8000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPCI0 */ {
+			.phys_start = 0xfe8df000,
+			.virt_start = 0xfe8df000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPCS */ {
+			.phys_start = 0xfe90f000,
+			.virt_start = 0xfe90f000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IVDP1C */ {
+			.phys_start = 0xfe8d0000,
+			.virt_start = 0xfe8d0000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IVDP1C */ {
+			.phys_start = 0xfe8d0200,
+			.virt_start = 0xfe8d0200,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VCPLF */ {
+			.phys_start = 0xfe910000,
+			.virt_start = 0xfe910000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VCPLF */ {
+			.phys_start = 0xfe910200,
+			.virt_start = 0xfe910200,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VDPB */ {
+			.phys_start = 0xfe900000,
+			.virt_start = 0xfe900000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VDPB */ {
+			.phys_start = 0xfe900200,
+			.virt_start = 0xfe900200,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FDP0 */ {
+			.phys_start = 0xfe940000,
+			.virt_start = 0xfe940000,
+			.size = 0x2400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FDP0 */ {
+			.phys_start = 0xfe950000,
+			.virt_start = 0xfe950000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPVD0 */ {
+			.phys_start = 0xfea27000,
+			.virt_start = 0xfea27000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPVD1 */ {
+			.phys_start = 0xfea2f000,
+			.virt_start = 0xfea2f000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPVD2 */ {
+			.phys_start = 0xfea37000,
+			.virt_start = 0xfea37000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSP */ {
+			.phys_start = 0xfe960000,
+			.virt_start = 0xfe960000,
+			.size = 0x8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSP-B */ {
+			.phys_start = 0xfe96f000,
+			.virt_start = 0xfe96f000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPD0 */ {
+			.phys_start = 0xfea20000,
+			.virt_start = 0xfea20000,
+			.size = 0x5000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPD1 */ {
+			.phys_start = 0xfea28000,
+			.virt_start = 0xfea28000,
+			.size = 0x5000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPD2 */ {
+			.phys_start = 0xfea30000,
+			.virt_start = 0xfea30000,
+			.size = 0x5000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSP */ {
+			.phys_start = 0xfe9a0000,
+			.virt_start = 0xfe9a0000,
+			.size = 0x8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPI0 */ {
+			.phys_start = 0xfe9af000,
+			.virt_start = 0xfe9af000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CSI20 */ {
+			.phys_start = 0xfea80000,
+			.virt_start = 0xfea80000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CSI40 */ {
+			.phys_start = 0xfeaa0000,
+			.virt_start = 0xfeaa0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HDMI0 */ {
+			.phys_start = 0xfead0000,
+			.virt_start = 0xfead0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DU */ {
+			.phys_start = 0xfeb00000,
+			.virt_start = 0xfeb00000,
+			.size = 0x70000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* LVDS */ {
+			.phys_start = 0xfeb90000,
+			.virt_start = 0xfeb90000,
+			.size = 0x14,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PRR */ {
+			.phys_start = 0xfff00044,
+			.virt_start = 0xfff00044,
+			.size = 0x4,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 416,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220822220202.26218-3-prabhakar.mahadev-lad.rj%40bp.renesas.com.
