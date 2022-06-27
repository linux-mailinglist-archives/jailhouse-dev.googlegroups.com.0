Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBO242KQMGQEZRK6R5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CE55B9C4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:42 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id f29-20020a19dc5d000000b004811c8d1918sf1044203lfj.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335622; cv=pass;
        d=google.com; s=arc-20160816;
        b=yCMX2rpILDG1tjv2YsftXTSorSVnNPsWkpXzaCzyf6Pj9SsSb1ZZVBGqFr8U8jCMAt
         oE5OQ9dXH2V9isu8F2zlraKDGjB3/VzWkJGDXaW0FnAagq0s9PXUQ1Q9vd0b41PZ/og5
         W644h8DLCH5buTWNRZg0uOJdUPL6er9I4V3CvhZwEBTspfnGJCSV+fh89UfEv1kUyTBi
         eEVt9NoDebLMaf+1mnAVTPCsdDKj0qCJ6KyRXqYCueitpvo0aoH0yRZn+ZWqr9WDHPIy
         XrgN4FFNy1D87pGhG7BEUsT3uQKeO8mSd4BJuypiT1Utyds1eIA7gL3s8/8GHnN1ZF8/
         P4ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=gaUp98wU1RpS1ccAzH7an7ZaP3jRxvhAAJQsphUCF0A=;
        b=XlXozYOhrOO4xe1Dx9Nd3C8CQAw/Q27+zaGQgZXJBkq5lYUFBt3sB5EWkiN5U9Si7n
         19WaYR5SLcamYaLzz/lyLIlE84P98clFobqFFh7xeQpAIoZC/TNdwg7N4xDmUJmpoRe8
         G9C2iFgUobKNRy1TYRl4AUccvxAU/CTsiXB6BwMjEKPg2g/RsV8vjmh71bNgG4MVkiiV
         jnJkmpc7IZENaxFXOt5aUSde/StjPQ/rHk1a3eOFoJn/OotRILG9boMuRs+JIHkvD/NV
         IBbUtmUxPwf1zAHFkEbucaDlcXtZClgxMHYFSRvgF2GPE5u4YygI89pzJlXtjvTJ8DJl
         IfPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cQTGwjKM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gaUp98wU1RpS1ccAzH7an7ZaP3jRxvhAAJQsphUCF0A=;
        b=p0Knnv1zAjLJJ3x5fi/+Tz3PuIux4+VwAeAzNZaLhc6vWBxGz40acJYqfIOc49ZC7c
         HMS83pecSEigqdU41MU5DPtNSt/+siDDKxT5/Sjgt6I11cKjVtlMdZhD96IKp7ARV2w6
         7uil/KBLv1LXJPJhM0qcZwnKqcPE+G1vu1l2IvHumRdy3Rn9F4vwrooDRZFdFOVW1CbF
         llqjNbd5JZ0n7NJZ5VvKf2sUm+6oAbyw0rg5IP2ttOzsN9ql+spqy0XU9zibLde9FKhF
         jEcTapmEUIugNgVhPkhjvlYsrTRa0d3VseSV0XBTDgCQufZrhjLOLt1V5GCXjas3E3ZQ
         rRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gaUp98wU1RpS1ccAzH7an7ZaP3jRxvhAAJQsphUCF0A=;
        b=iojfCVtBGUMCb04kVrA0LnLnsPFiUyFaXtBQYP34UQiLsr+TDhcw+He7nlxM9gVh2L
         /aeUc8nic/GPp/Ddsw+7IEmTtEHw2ZS2uTjW0CxlsF4S4u62kfMLnBggIgPlxc81Wq2z
         5wlhxaMmdbJRYyGvkioQxKwDm94cfgqW7VXsBoZwXzAIY0k3EzxWPrromanB8NiB/PiI
         zsW+StsJzNjpRAILQKCifgdnv6HHPyN7K8il4sT06Nn22IWO4tRq9FS3Yw5Q0DnsCalk
         BFpaTpI/yP+/MTm3saV89xHlKTqtOpVIGQ86H1x7yWgWz4adLFtFJqXep6DjIYkShiuJ
         5Bpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9GgjsM+UwslUSKISvy0VlXGZWaxVDl3wxiy8VdiMAoQgytWysF
	tj1pmPKeMBl2D85URC+Ckk4=
X-Google-Smtp-Source: AGRyM1sSqtHNOxf01Wp8plH4cnWA9yNKQQcJwCoKiwq3IoK07kukk9LOftBeVBcG3QHEOeWAm+BEBg==
X-Received: by 2002:a05:6512:281c:b0:47f:bd92:4185 with SMTP id cf28-20020a056512281c00b0047fbd924185mr8402005lfb.11.1656335621878;
        Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:91cf:0:b0:25a:8a25:7576 with SMTP id u15-20020a2e91cf000000b0025a8a257576ls2195012ljg.0.gmail;
 Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
X-Received: by 2002:a2e:aa1c:0:b0:25b:ae5d:9c20 with SMTP id bf28-20020a2eaa1c000000b0025bae5d9c20mr6632734ljb.508.1656335619844;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335619; cv=none;
        d=google.com; s=arc-20160816;
        b=Aw8fXia/QAPSaxnOaI3Dye/ZaXqHRU8FBW4azJDI8amHAYn5/+p3Xmcvs9gdLWmADz
         cJK2dJzxjI6/0vUWQWtfO9M+RHuQr+SNpacN1pQpHCgNBlJftUU5XcCkY8/3v4D2QRzH
         TdmUVXMvn0ETDC7L/lQrDgjeGzFPQNzzaibQBykJ+JAG1FBHfJuDmnG1dA4mvt80qGDf
         2GctuLTqV3zL3kdEmlIjRRM7DbRv1b9BvLHyjX5Y5IlSKF3z98mqSlsAoVFFiSrJGsQW
         JbTSDfkAyABW+vOqW5ck2m8qV3PSCy0E5KMjLOEWp1FAYqZnDuh5kBiBkitUTP5lNaPC
         vXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IgxBOPMdv/TNVyDPvSRV3wK4FzQIDjitGSG3vlY/9FI=;
        b=TEpkzWlPrJyGkVd+Pnm+mfqedPSLF9LXqNat96lL3hpbSoWCMYnHPDv8uCuQYMGm04
         JSxz90Gyx5QWpcY/IgJzju4W72EGtuiNo2KSf3wOj+YEWQ0WsQ+os7bgTTenqF5FK3/m
         XQ8TvAoJYoT5Y4J4q6r01H9AIroCBtXDUZXAW9Q4aQaI9/jyf9Y6RKCEHG4WHPxuIWDr
         QBQuuO80hN0QGPsgTPjmIM/AldJ6hM+FrPANZ/bD4bQe34SZprBg/SlIKZ1uGSIMKt/u
         Emk0fJGTMrbLOBXKWFf2WLSHLQGsh0XqDzF9zG0zjyea47H8cjVkWK4GZ1wbeUTCtKY6
         mVkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cQTGwjKM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z14-20020a05651c11ce00b0025a7388680bsi276745ljo.6.2022.06.27.06.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp831DzfzxxQ;
	Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:38 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 18/20] configs: arm64: Convert to new CPU configuration format
Date: Mon, 27 Jun 2022 15:13:27 +0200
Message-ID: <20220627131329.3659-19-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cQTGwjKM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

At this chance, the inmate demo is moved to the second core for
jetson-tx1, miriac, ultra96 and zynqmp-zcu102.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
[ralf: rebase to next, catch missing configs]
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/arm64/amd-seattle-inmate-demo.c       |  8 ++-
 configs/arm64/amd-seattle-linux-demo.c        | 11 +++-
 configs/arm64/amd-seattle.c                   | 29 +++++++++-
 configs/arm64/espressobin-inmate-demo.c       | 10 ++--
 configs/arm64/espressobin-linux-demo.c        | 10 ++--
 configs/arm64/espressobin.c                   | 13 +++--
 configs/arm64/foundation-v8-inmate-demo.c     |  8 ++-
 configs/arm64/foundation-v8-linux-demo.c      | 11 +++-
 configs/arm64/foundation-v8.c                 | 17 +++++-
 configs/arm64/hikey-inmate-demo.c             | 10 ++--
 configs/arm64/hikey-linux-demo.c              | 13 +++--
 configs/arm64/hikey.c                         | 31 +++++++++--
 configs/arm64/imx8dxl-inmate-demo.c           |  8 ++-
 configs/arm64/imx8dxl.c                       | 13 +++--
 configs/arm64/imx8mm-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mm-linux-demo.c             | 11 +++-
 configs/arm64/imx8mm.c                        | 19 +++++--
 configs/arm64/imx8mn-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mn-linux-demo.c             | 11 +++-
 configs/arm64/imx8mn.c                        | 19 +++++--
 configs/arm64/imx8mp-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mp-linux-demo.c             | 11 +++-
 configs/arm64/imx8mp.c                        | 19 +++++--
 configs/arm64/imx8mq-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mq-linux-demo.c             | 11 +++-
 configs/arm64/imx8mq.c                        | 19 +++++--
 configs/arm64/imx8qm-inmate-demo.c            |  8 ++-
 configs/arm64/imx8qm-linux-demo.c             | 11 +++-
 configs/arm64/imx8qm.c                        | 25 +++++++--
 configs/arm64/jetson-tx1-inmate-demo.c        |  8 ++-
 configs/arm64/jetson-tx1-linux-demo.c         | 11 +++-
 configs/arm64/jetson-tx1.c                    | 17 +++++-
 configs/arm64/jetson-tx2-inmate-demo.c        |  8 ++-
 configs/arm64/jetson-tx2.c                    | 17 +++++-
 configs/arm64/k3-am625-sk-inmate-demo.c       |  8 ++-
 configs/arm64/k3-am625-sk-linux-demo.c        | 14 ++++-
 configs/arm64/k3-am625-sk.c                   | 17 +++++-
 configs/arm64/k3-am654-idk-linux-demo.c       | 11 +++-
 configs/arm64/k3-am654-idk.c                  | 17 +++++-
 configs/arm64/k3-am654-inmate-demo.c          |  8 ++-
 configs/arm64/k3-j7200-evm-inmate-demo.c      |  8 ++-
 configs/arm64/k3-j7200-evm-linux-demo.c       |  8 ++-
 configs/arm64/k3-j7200-evm.c                  | 11 +++-
 configs/arm64/k3-j721e-evm-inmate-demo.c      |  8 ++-
 configs/arm64/k3-j721e-evm-linux-demo.c       |  8 ++-
 configs/arm64/k3-j721e-evm.c                  | 11 +++-
 configs/arm64/ls1028a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1028a-rdb-linux-demo.c        |  8 ++-
 configs/arm64/ls1028a-rdb.c                   | 13 +++--
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   | 11 +++-
 configs/arm64/ls1043a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1043a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls1043a-rdb.c                   | 19 +++++--
 configs/arm64/ls1046a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1046a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls1046a-rdb.c                   | 19 +++++--
 configs/arm64/ls1088a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1088a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls1088a-rdb.c                   | 29 +++++++++-
 configs/arm64/ls2088a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls2088a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls2088a-rdb.c                   | 29 +++++++++-
 configs/arm64/macchiatobin-inmate-demo.c      | 10 ++--
 configs/arm64/macchiatobin-linux-demo.c       | 13 +++--
 configs/arm64/macchiatobin.c                  | 19 +++++--
 .../arm64/miriac-sbc-ls1046a-inmate-demo.c    |  8 ++-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 11 +++-
 configs/arm64/miriac-sbc-ls1046a.c            | 17 +++++-
 configs/arm64/pine64-plus-inmate-demo.c       |  8 ++-
 configs/arm64/pine64-plus-linux-demo.c        | 11 +++-
 configs/arm64/pine64-plus.c                   | 17 +++++-
 configs/arm64/qemu-arm64-inmate-demo.c        | 10 ++--
 configs/arm64/qemu-arm64-linux-demo.c         | 13 +++--
 configs/arm64/qemu-arm64-zephyr-demo.c        | 11 +++-
 configs/arm64/qemu-arm64.c                    | 55 +++++++++++++++++--
 configs/arm64/rpi4-inmate-demo.c              | 10 ++--
 configs/arm64/rpi4-linux-demo.c               | 13 +++--
 configs/arm64/rpi4.c                          | 19 +++++--
 configs/arm64/ultra96-inmate-demo.c           | 10 ++--
 configs/arm64/ultra96-linux-demo.c            | 13 +++--
 configs/arm64/ultra96.c                       | 19 +++++--
 configs/arm64/zynqmp-zcu102-inmate-demo.c     | 10 ++--
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 10 ++--
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 13 +++--
 configs/arm64/zynqmp-zcu102.c                 | 19 +++++--
 85 files changed, 843 insertions(+), 286 deletions(-)

diff --git a/configs/arm64/amd-seattle-inmate-demo.c b/configs/arm64/amd-seattle-inmate-demo.c
index d920804c..e74cc21a 100644
--- a/configs/arm64/amd-seattle-inmate-demo.c
+++ b/configs/arm64/amd-seattle-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x10,
+		{
+			.phys_id = 0x0200,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index f4ed12d7..2b42e640 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc0,
+		{
+			.phys_id = 0x0300,
+		},
+		{
+			.phys_id = 0x0301,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 6409d934..2d764b8d 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[3];
@@ -52,7 +52,7 @@ struct {
 		.root_cell = {
 			.name = "amd-seattle",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -60,7 +60,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0200,
+		},
+		{
+			.phys_id = 0x0201,
+		},
+		{
+			.phys_id = 0x0300,
+		},
+		{
+			.phys_id = 0x0301,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/espressobin-inmate-demo.c b/configs/arm64/espressobin-inmate-demo.c
index 921b93b0..32cdc48e 100644
--- a/configs/arm64/espressobin-inmate-demo.c
+++ b/configs/arm64/espressobin-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Marvell ESPRESSObin board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index c326b6d5..3a7dbb96 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on ESPRESSObin:
  * 1 CPU, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "ESPRESSObin-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index 1b75f6d7..92ecac98 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Marvell ESPRESSObin board
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -54,7 +54,7 @@ struct {
 		.root_cell = {
 			.name = "ESPRESSObin",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -64,7 +64,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/foundation-v8-inmate-demo.c b/configs/arm64/foundation-v8-inmate-demo.c
index 2dda3adf..2cf52d3f 100644
--- a/configs/arm64/foundation-v8-inmate-demo.c
+++ b/configs/arm64/foundation-v8-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/foundation-v8-linux-demo.c b/configs/arm64/foundation-v8-linux-demo.c
index 842afe9f..92b2bff9 100644
--- a/configs/arm64/foundation-v8-linux-demo.c
+++ b/configs/arm64/foundation-v8-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[3];
 	struct jailhouse_irqchip irqchips[1];
 } __attribute__((packed)) config = {
@@ -28,7 +28,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
 		.num_pci_devices = 0,
@@ -42,7 +42,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc, /* 2nd and 3rd CPUs */
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	/* Physical memory map:
diff --git a/configs/arm64/foundation-v8.c b/configs/arm64/foundation-v8.c
index 7a632491..5c963a3b 100644
--- a/configs/arm64/foundation-v8.c
+++ b/configs/arm64/foundation-v8.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[3];
 } __attribute__((packed)) config = {
@@ -53,14 +53,25 @@ struct {
 		.root_cell = {
 			.name = "foundation-v8",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/hikey-inmate-demo.c b/configs/arm64/hikey-inmate-demo.c
index ce5eb91b..53f7c56e 100644
--- a/configs/arm64/hikey-inmate-demo.c
+++ b/configs/arm64/hikey-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on LeMaker HiKey board, 2GiB:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x10,
+		{
+			.phys_id = 0x0100,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index cb6e101c..3368947b 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on HiKey:
  * 1 CPU, 128M RAM, serial port 3
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "hikey-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc0,
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 4aadfaae..353d8a7e 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -3,7 +3,7 @@
  *
  * Configuration for LeMaker HiKey board, 2 GB
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -53,7 +53,7 @@ struct {
 		.root_cell = {
 			.name = "HiKey",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -63,7 +63,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0002,
+		},
+		{
+			.phys_id = 0x0003,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8dxl-inmate-demo.c b/configs/arm64/imx8dxl-inmate-demo.c
index 089a0b8d..011070ef 100644
--- a/configs/arm64/imx8dxl-inmate-demo.c
+++ b/configs/arm64/imx8dxl-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 #else
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 #endif
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -40,7 +40,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
index f70826b1..7e18afc3 100644
--- a/configs/arm64/imx8dxl.c
+++ b/configs/arm64/imx8dxl.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -49,16 +49,21 @@ struct {
 		},
 		.root_cell = {
 			.name = "imx8dxl",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 2, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
index 5791b945..0d7123e5 100644
--- a/configs/arm64/imx8mm-inmate-demo.c
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
index 49272607..b83a110a 100644
--- a/configs/arm64/imx8mm-linux-demo.c
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -39,7 +39,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index 2556ac31..6f832131 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -58,16 +58,27 @@ struct {
 		.root_cell = {
 			.name = "imx8mm",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn-inmate-demo.c b/configs/arm64/imx8mn-inmate-demo.c
index 6f04a5b3..7171e47d 100644
--- a/configs/arm64/imx8mn-inmate-demo.c
+++ b/configs/arm64/imx8mn-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn-linux-demo.c b/configs/arm64/imx8mn-linux-demo.c
index 3644b6d1..6799bb3f 100644
--- a/configs/arm64/imx8mn-linux-demo.c
+++ b/configs/arm64/imx8mn-linux-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -39,7 +39,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
index 91d088ae..52b643a0 100644
--- a/configs/arm64/imx8mn.c
+++ b/configs/arm64/imx8mn.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,16 +53,27 @@ struct {
 		.root_cell = {
 			.name = "imx8mm",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 123, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index 127392df..7c9a37bd 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index 22793c2a..8f14ed5d 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[4];
@@ -31,7 +31,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -39,7 +39,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index 7fbf6ef7..9fbcddc3 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[4];
@@ -53,17 +53,28 @@ struct {
 		.root_cell = {
 			.name = "imx8mp",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			/* gpt5/4/3/2 not used by root cell */
 			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
index d1d518df..6ff57473 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
index 03e67a94..df1090ab 100644
--- a/configs/arm64/imx8mq-linux-demo.c
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index e853e5f2..c3fec6c9 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,16 +53,27 @@ struct {
 		.root_cell = {
 			.name = "imx8mq",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm-inmate-demo.c b/configs/arm64/imx8qm-inmate-demo.c
index 1170a35f..770e9d99 100644
--- a/configs/arm64/imx8qm-inmate-demo.c
+++ b/configs/arm64/imx8qm-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
index 0d2d91c9..9d21d114 100644
--- a/configs/arm64/imx8qm-linux-demo.c
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "imx8qm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -36,7 +36,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index 052a58d4..297fc53c 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -16,7 +16,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[6];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -67,11 +67,11 @@ struct {
 		.root_cell = {
 			.name = "imx8qm",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			/*
 			 * vpci_irq_base not include base 32
 			 */
@@ -80,7 +80,24 @@ struct {
 	},
 
 	.cpus = {
-		0x3f,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1-inmate-demo.c b/configs/arm64/jetson-tx1-inmate-demo.c
index 1cfbe7f7..3fbb2a3b 100644
--- a/configs/arm64/jetson-tx1-inmate-demo.c
+++ b/configs/arm64/jetson-tx1-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "jetson-tx1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -39,7 +39,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index c5f2d811..e5c9abd2 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -24,7 +24,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -36,7 +36,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -54,7 +54,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index c9dbec87..d63b15b9 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[46];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -57,7 +57,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "Jetson-TX1",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 
diff --git a/configs/arm64/jetson-tx2-inmate-demo.c b/configs/arm64/jetson-tx2-inmate-demo.c
index ed1a7d97..58058291 100644
--- a/configs/arm64/jetson-tx2-inmate-demo.c
+++ b/configs/arm64/jetson-tx2-inmate-demo.c
@@ -13,7 +13,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -22,7 +22,7 @@ struct {
 		.name = "jetson-tx2-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -34,7 +34,9 @@ struct {
 	},
 
 	.cpus = {
-		0x1,
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
index 58f7d488..86ae2f8f 100644
--- a/configs/arm64/jetson-tx2.c
+++ b/configs/arm64/jetson-tx2.c
@@ -23,7 +23,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[61];
 	struct jailhouse_irqchip irqchips[3];
 } __attribute__((packed)) config = {
@@ -55,14 +55,25 @@ struct {
 		},
 		.root_cell = {
 			.name = "Jetson-TX2",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 		},
 	},
 
 	.cpus = {
-		0x39,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 
diff --git a/configs/arm64/k3-am625-sk-inmate-demo.c b/configs/arm64/k3-am625-sk-inmate-demo.c
index 49edd62d..f65456d1 100644
--- a/configs/arm64/k3-am625-sk-inmate-demo.c
+++ b/configs/arm64/k3-am625-sk-inmate-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -44,7 +44,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
index a3385efc..4dff124a 100644
--- a/configs/arm64/k3-am625-sk-linux-demo.c
+++ b/configs/arm64/k3-am625-sk-linux-demo.c
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[3];
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -33,7 +33,7 @@ struct {
 		.name = "k3-am625-sk-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -50,7 +50,15 @@ struct {
 	},
 
 	.cpus = {
-		0xe,
+		{
+			.phys_id = 1
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
index 2e5c3aef..dc1353de 100644
--- a/configs/arm64/k3-am625-sk.c
+++ b/configs/arm64/k3-am625-sk.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[31];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
@@ -52,7 +52,7 @@ struct {
 		.root_cell = {
 			.name = "k3-am625-sk",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -61,7 +61,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 3937dff3..419cdeea 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -33,7 +33,7 @@ struct {
 		.name = "k3-am654-idk-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -50,7 +50,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 48b8f867..209e8285 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[25];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
@@ -52,7 +52,7 @@ struct {
 		.root_cell = {
 			.name = "k3-am654-idk",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -61,7 +61,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-inmate-demo.c b/configs/arm64/k3-am654-inmate-demo.c
index 00367471..d3a7e250 100644
--- a/configs/arm64/k3-am654-inmate-demo.c
+++ b/configs/arm64/k3-am654-inmate-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		{
+			.phys_id = 0x0001,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j7200-evm-inmate-demo.c b/configs/arm64/k3-j7200-evm-inmate-demo.c
index c916b439..df6bf832 100644
--- a/configs/arm64/k3-j7200-evm-inmate-demo.c
+++ b/configs/arm64/k3-j7200-evm-inmate-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "k3-j7200 inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
 		.num_pci_devices = 1,
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index 1fc98bf8..697a8e7c 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -34,7 +34,7 @@ struct {
 		.name = "k3-j7200-evm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -51,7 +51,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index cc452157..d7b71e19 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[32];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
@@ -70,7 +70,7 @@ struct {
 		.root_cell = {
 			.name = "k3-j7200-evm",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -80,7 +80,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 45a9202f..85bb41e6 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
 		.num_pci_devices = 1,
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index af6a5a2f..6d6fe61c 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -23,7 +23,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
@@ -35,7 +35,7 @@ struct {
 		.name = "k3-j721e-evm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -52,7 +52,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 19f9d967..12f9cf49 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
@@ -83,7 +83,7 @@ struct {
 		.root_cell = {
 			.name = "k3-j721e-evm",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -93,7 +93,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c b/configs/arm64/ls1028a-rdb-inmate-demo.c
index 8b45a9ed..6f825cb0 100644
--- a/configs/arm64/ls1028a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c b/configs/arm64/ls1028a-rdb-linux-demo.c
index e2cb01af..8c39bdbb 100644
--- a/configs/arm64/ls1028a-rdb-linux-demo.c
+++ b/configs/arm64/ls1028a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c
index 6027772b..00597bf9 100644
--- a/configs/arm64/ls1028a-rdb.c
+++ b/configs/arm64/ls1028a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[76];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -50,16 +50,21 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1028a",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 50 - 32,
 		},
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
index 89552b16..b6bef553 100644
--- a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb-inmate-demo.c b/configs/arm64/ls1043a-rdb-inmate-demo.c
index 25645745..3f7847f1 100644
--- a/configs/arm64/ls1043a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1043a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb-linux-demo.c b/configs/arm64/ls1043a-rdb-linux-demo.c
index afc10ede..f648bd12 100644
--- a/configs/arm64/ls1043a-rdb-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb.c b/configs/arm64/ls1043a-rdb.c
index 892dc444..f28e323f 100644
--- a/configs/arm64/ls1043a-rdb.c
+++ b/configs/arm64/ls1043a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[61];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -52,16 +52,27 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1043a",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 67 - 32, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
index 6c992caa..64eb7196 100644
--- a/configs/arm64/ls1046a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
index 6bba61fb..42411b16 100644
--- a/configs/arm64/ls1046a-rdb-linux-demo.c
+++ b/configs/arm64/ls1046a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
index d05c1628..c9fcdc9e 100644
--- a/configs/arm64/ls1046a-rdb.c
+++ b/configs/arm64/ls1046a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[64];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -52,16 +52,27 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1046a",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 67 - 32, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1088a-rdb-inmate-demo.c b/configs/arm64/ls1088a-rdb-inmate-demo.c
index 3caee05d..c22e6519 100644
--- a/configs/arm64/ls1088a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1088a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1088a-rdb-linux-demo.c b/configs/arm64/ls1088a-rdb-linux-demo.c
index ee8b18e9..793a4200 100644
--- a/configs/arm64/ls1088a-rdb-linux-demo.c
+++ b/configs/arm64/ls1088a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x2,
+		},
+		{
+			.phys_id = 0x3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1088a-rdb.c b/configs/arm64/ls1088a-rdb.c
index cb93df1e..692d30f5 100644
--- a/configs/arm64/ls1088a-rdb.c
+++ b/configs/arm64/ls1088a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[63];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,8 +53,8 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1088a",
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.vpci_irq_base = 114 - 32,
@@ -62,7 +62,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0,
+		},
+		{
+			.phys_id = 0x1,
+		},
+		{
+			.phys_id = 0x2,
+		},
+		{
+			.phys_id = 0x3,
+		},
+		{
+			.phys_id = 0x100,
+		},
+		{
+			.phys_id = 0x101,
+		},
+		{
+			.phys_id = 0x102,
+		},
+		{
+			.phys_id = 0x103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls2088a-rdb-inmate-demo.c b/configs/arm64/ls2088a-rdb-inmate-demo.c
index bbc6812c..4c9dc888 100644
--- a/configs/arm64/ls2088a-rdb-inmate-demo.c
+++ b/configs/arm64/ls2088a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -26,7 +26,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls2088a-rdb-linux-demo.c b/configs/arm64/ls2088a-rdb-linux-demo.c
index b20e6f17..01c54096 100644
--- a/configs/arm64/ls2088a-rdb-linux-demo.c
+++ b/configs/arm64/ls2088a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -26,7 +26,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -34,7 +34,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x100,
+		},
+		{
+			.phys_id = 0x101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls2088a-rdb.c b/configs/arm64/ls2088a-rdb.c
index 421ac7da..3a9c4b8e 100644
--- a/configs/arm64/ls2088a-rdb.c
+++ b/configs/arm64/ls2088a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[70];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,8 +53,8 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls2088a",
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.vpci_irq_base = 160 - 32,
@@ -62,7 +62,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0,
+		},
+		{
+			.phys_id = 0x1,
+		},
+		{
+			.phys_id = 0x100,
+		},
+		{
+			.phys_id = 0x101,
+		},
+		{
+			.phys_id = 0x200,
+		},
+		{
+			.phys_id = 0x201,
+		},
+		{
+			.phys_id = 0x300,
+		},
+		{
+			.phys_id = 0x301,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/macchiatobin-inmate-demo.c b/configs/arm64/macchiatobin-inmate-demo.c
index 9c76f606..90d4885f 100644
--- a/configs/arm64/macchiatobin-inmate-demo.c
+++ b/configs/arm64/macchiatobin-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Marvell MACCHIATObin board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017-2018
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x0001,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index ad29bbd5..726242b8 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on MACCHIATObin:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2018
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index db158824..1233ec58 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Marvell MACCHIATObin board
  *
- * Copyright (c) Siemens AG, 2017-2018
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -56,7 +56,7 @@ struct {
 		.root_cell = {
 			.name = "MACCHIATObin",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
index 39e97888..ca72c7a2 100644
--- a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 841c21a4..f49881e6 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index 96a7139e..4a23e52c 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[55];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -58,7 +58,7 @@ struct {
 		.root_cell = {
 			.name = "miriac SBC-LS1046A",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -68,7 +68,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
index 73cde95c..18c5f8ad 100644
--- a/configs/arm64/pine64-plus-inmate-demo.c
+++ b/configs/arm64/pine64-plus-inmate-demo.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/pine64-plus-linux-demo.c b/configs/arm64/pine64-plus-linux-demo.c
index 1d099906..3d11fd9a 100644
--- a/configs/arm64/pine64-plus-linux-demo.c
+++ b/configs/arm64/pine64-plus-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
index c824ca78..24c9b981 100644
--- a/configs/arm64/pine64-plus.c
+++ b/configs/arm64/pine64-plus.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[43];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -55,7 +55,7 @@ struct {
 		.root_cell = {
 			.name = "Pine64-Plus",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -65,7 +65,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64-inmate-demo.c b/configs/arm64/qemu-arm64-inmate-demo.c
index 6863ce24..528a74f4 100644
--- a/configs/arm64/qemu-arm64-inmate-demo.c
+++ b/configs/arm64/qemu-arm64-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on QEMU arm64 virtual target
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index d8096e8e..86b99000 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on QEMU arm64:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64-zephyr-demo.c b/configs/arm64/qemu-arm64-zephyr-demo.c
index e5e36237..dbc72f6a 100644
--- a/configs/arm64/qemu-arm64-zephyr-demo.c
+++ b/configs/arm64/qemu-arm64-zephyr-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -32,7 +32,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -49,7 +49,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 2e9fcde6..bb3e079f 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -3,7 +3,7 @@
  *
  * Configuration for QEMU arm64 virtual target, 1G RAM, 16 cores
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[16];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -54,7 +54,7 @@ struct {
 		.root_cell = {
 			.name = "qemu-arm64",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -64,7 +64,54 @@ struct {
 	},
 
 	.cpus = {
-		0xffff,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
+		{
+			.phys_id = 6,
+		},
+		{
+			.phys_id = 7,
+		},
+		{
+			.phys_id = 8,
+		},
+		{
+			.phys_id = 9,
+		},
+		{
+			.phys_id = 10,
+		},
+		{
+			.phys_id = 11,
+		},
+		{
+			.phys_id = 12,
+		},
+		{
+			.phys_id = 13,
+		},
+		{
+			.phys_id = 14,
+		},
+		{
+			.phys_id = 15,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
index 1bc244f5..68030d81 100644
--- a/configs/arm64/rpi4-inmate-demo.c
+++ b/configs/arm64/rpi4-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Raspberry Pi 4:
  * 1 CPU, 64K RAM, serial port 0
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) Siemens AG, 2020-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
index f93c564a..7e7070fa 100644
--- a/configs/arm64/rpi4-linux-demo.c
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Raspberry Pi 4:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
index 68bb1a24..e1dd8769 100644
--- a/configs/arm64/rpi4.c
+++ b/configs/arm64/rpi4.c
@@ -3,7 +3,7 @@
  *
  * Test configuration for Raspberry Pi 4 (quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) Siemens AG, 2020-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -56,7 +56,7 @@ struct {
 		.root_cell = {
 			.name = "Raspberry-Pi4",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,18 @@ struct {
 	},
 
 	.cpus = {
-		0b1111,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ultra96-inmate-demo.c b/configs/arm64/ultra96-inmate-demo.c
index c61130a1..533687c8 100644
--- a/configs/arm64/ultra96-inmate-demo.c
+++ b/configs/arm64/ultra96-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Avnet Ultra96 board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016-2020
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index f1f32fd2..a93aca29 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Avnet Ultra96 board:
  * 2 CPUs, 128M RAM, serial port 2
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -29,7 +29,7 @@ struct {
 		.name = "Ultra96-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 93e2ee83..ab18f178 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Avnet Ultra96 board
  *
- * Copyright (c) Siemens AG, 2016-2020
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -63,7 +63,7 @@ struct {
 		.root_cell = {
 			.name = "Ultra96",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -74,7 +74,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo.c b/configs/arm64/zynqmp-zcu102-inmate-demo.c
index 304b4cda..c4d8dae8 100644
--- a/configs/arm64/zynqmp-zcu102-inmate-demo.c
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Xilinx ZynqMP ZCU102 eval board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 76ed8064..d6f42ca8 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -4,7 +4,7 @@
  * Configuration for 2nd linux-demo inmate on ZynqMP ZCU102:
  * 1 CPU, 112M RAM
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -30,7 +30,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 32e38089..91a6e2b4 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on ZynqMP ZCU102:
  * 2 CPUs, 128M RAM, serial port 2
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -29,7 +29,7 @@ struct {
 		.name = "ZynqMP-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -45,7 +45,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 492dc566..1f88d6db 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Xilinx ZynqMP ZCU102 eval board
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -64,7 +64,7 @@ struct {
 		.root_cell = {
 			.name = "ZynqMP-ZCU102",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -75,7 +75,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-19-ralf.ramsauer%40oth-regensburg.de.
