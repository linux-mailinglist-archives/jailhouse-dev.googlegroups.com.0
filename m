Return-Path: <jailhouse-dev+bncBDKLL2HKV4DRBZ5RZGTAMGQE6SEFPNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id C3511773AD4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Aug 2023 17:02:01 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id d75a77b69052e-40fda0270basf67816511cf.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Aug 2023 08:02:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1691506920; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y8zkhzUbETYb2fbGMfzDYO5RuqV95GiAhv/727NQnT86+K9OhyCAZuHzpHuZuCTjUj
         waDx28TdSSZl6VWOOxeb0sU5dPYfBOPMWaWMBMBHMvMZxrh6rUuqo4b7q+gnjfVc/e6v
         uzdpNLjN0azg0q8dAMmMJMWgQjV5siEOVwzlDNFL04ygWdilc5xoJo3etHfF2EK1ozw/
         Glo0FyovQtwGj6KDmm2V2eWFLF3gqRoNho8bUAr3/U9AaWUpQHnxxqW3Eq7qeOyV6ROE
         Cfd72BmcFsg5zmWE0Bq1izjLTRq2Tdixw3dhF/Zpc4Ndrkzt0AP/IfdSwRyZMQgS4R4J
         3S4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=mgnKs7bsMSc74ziCllBDPT0WDe3ccK9z1fby9eYDXnQ=;
        fh=lHviolv2QIugOx+iONdMildTHSwHBzLPv847DRGo4aU=;
        b=FjlTGhq2TUYhsUU/PXjVk8Ci+SEVupKsvrlJXe3AFd1n8X3mBINkeUz3nXkkUHCWA8
         DcPE8JyqJvaPIeH+/SJPn5gIINFBF/QnBtfbFATYOmXwglQztaSobgdevuAgvHmjffnq
         yc6epvO/M6fYu4uff7eo5zodZFClncTA9lKllEqR/yS958lkZJEfpaWmJ6AckH20D+/a
         00F4Y/RMbftIIYVjqzPl6wuAeZgyjrK2s9K5U8XzCvMSzvuimMiabqhNZDO7fpaRn3H7
         gIknGin+ntzavuFCOHn5+Aub8mIJnFrQt5qGsWpMGAq38dYMl8R51QIGQnpBls7KsqCo
         Wa+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=bwS8WGX9;
       spf=pass (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=barathiraja@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1691506920; x=1692111720;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mgnKs7bsMSc74ziCllBDPT0WDe3ccK9z1fby9eYDXnQ=;
        b=sGGC3DlGSGG0WGW8/Duh0qMukJHS8SqSHTb6//QFVrYzAQpxUnR4eo/5pxcGNryb0J
         +ppRC4MuAx4KPo13j6hOqFlLc7tLDQSIPfbt0nGzwByIpMkjutsu+11+gZ8I6+EEiSfE
         khMh4Fp6DvfXqnb1pOZ1DjSn1AOepbhJJtTZ77wpSBuzojdGB3NHkg0kEBMNF1uOuifV
         o6gXr1AK1mDhog1a2b6syQxoO7ZNfplvd4imf63Afv8j+qeYWjIuVkBgajDIf1vstOzK
         ec2xE+RanlDNwALCvrL32oQ+ZGhpYrlo10RmzKdhjW4NFtyB2ToeEby2UE+FiuPmitWX
         m8cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691506920; x=1692111720;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgnKs7bsMSc74ziCllBDPT0WDe3ccK9z1fby9eYDXnQ=;
        b=Bwc5UWWci6jdRxDuXL7+863hTRllIT2pAYk1K8CrszNpV5kaZCcxtlX9yrJGkzGxKI
         l0YUzwRcugn9ndwAjBWTGmRL1BBV/bueHyPlIFK7EP7XNi1t9/K3ZwvgMtk2EIz5FRaN
         WCFa8/1pNwJOcpVAf/r25GQup7lrXOMWOkApRJacNL+Ako9tf8yxYzTFXSze0q6lI9wd
         qmHq5kvYxjU1qnd07XOwoS6k5stBUCqKCLXmcTDZpvPKrRBFpqrVoJAZuo06W96F0WkG
         2brYOgqkm6SRmHH41uQp3MuGA6hoQEQGeQ5T+AijJX9plHpls+k0FW/mRheObIvUP4NS
         OUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691506920; x=1692111720;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mgnKs7bsMSc74ziCllBDPT0WDe3ccK9z1fby9eYDXnQ=;
        b=JuS3Qs9fDZ+x/A/3Ore9nKLPTTtkqyfVKLSQLdd8EtU3I/ZY+WuL6m2B9HoBBdA6kY
         a3HSK0k1QmR1rw5bYMUQs8qstWW2GmQBPCW15uAzqbuTR28VFifSrJzEWcTqNJk0mvT8
         Rjy5s+ippt1HxEVoG5WEvZEL+tFHijLLqJURZvIJAXmO4/KC22gw89yazZLpMrHlXLpi
         wYdvF8GevEG7MuLv0hMrAMGMAEddoqmqjKw4MLwEDu7UrDHmpTt6ucbxDOmYIqriDvFv
         jOqdJF1wvJvu4Vo6n2+PGsKH0CW54qb+2/q935jE6AFLBOKT248rl/cyZCLEdTWuYbpZ
         wg8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwY8UTx6/Jbf/8XtrYott626u2kiQbzFkXfoTmz/hkSZoIvIAoW
	rkxRz+9YA+V4emu5UEDttLg=
X-Google-Smtp-Source: AGHT+IERvJelTZw+B7PI8cT6wFw/6Cq+843Yfpa59CSpllrNe7Yo/nvh654uhX01L1qkafSLkkN2+g==
X-Received: by 2002:ac8:5945:0:b0:403:e959:710f with SMTP id 5-20020ac85945000000b00403e959710fmr15663465qtz.49.1691506920231;
        Tue, 08 Aug 2023 08:02:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5314:0:b0:3ff:301b:5417 with SMTP id t20-20020ac85314000000b003ff301b5417ls1693445qtn.2.-pod-prod-05-us;
 Tue, 08 Aug 2023 08:01:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1d5:b0:40f:db31:3a8e with SMTP id t21-20020a05622a01d500b0040fdb313a8emr16087386qtw.46.1691506918855;
        Tue, 08 Aug 2023 08:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691506918; cv=none;
        d=google.com; s=arc-20160816;
        b=aywzbaWz5AqnDZR5j9PnXJBxRV1Y/6dqGUzuIrKg1N4vf1p+uMWra/N85qWktr2nBS
         IVKiRdJloblcB933nsHVSPCv5Abmc//aWJhzCdpHDyFtPOW+VUfgAnI+peiagSx2j17A
         Ap7VFjL8ZIS5antFFSSbnVo7iSQ/pvi8aVaJHu7WuR5URFgisgFRSJS8ZGq1wIrjHR0q
         2hLw9lT27d6HM2N09X6c/a6oOApyR/ryJ5TRLVHrS+bN9+dqCShwkiJVYek93KOE4amq
         AlXefo+cEZ03mYTN8ZtbHBTrNBHBvZI5o5+/87FvYlFQFJIC1kdDkYBwFyfbpDwe8rZH
         L9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/nKtfxIk9iHlDUHsI2BhlbovK+u8AtRw+e4qlq+h33I=;
        fh=lHviolv2QIugOx+iONdMildTHSwHBzLPv847DRGo4aU=;
        b=GoQF9ygQLSKTZFFx4Q8EwBOP4eZdNZ3d5sjzoHHDJqAfN8eHAVwmGlPFF2kNgZFuvV
         N3mvExkRdiifWcdQ+1EIr1403occEOfK+K7U/Iz+jdmpojWpr9rnfUWL3EwBdX83fil1
         jeVxCR6NdxPQ5nL4/2aQTCv4PoeeDTw29KAiIsFLV9AlEcs5iE/spuopNr+NLjno2VGq
         RryP7Dg4JLFVultqyRFMYRx7wZbdRXNQov0KItkUoj4SaIytHtPaI298DXaCNezA/SnZ
         B09pIWexusbb8YqvQN6/qyp27T/Ui2M8CKNxN5ah8YhbZ4sJM5CyywfHej6WLwQCsNYS
         T0Ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=bwS8WGX9;
       spf=pass (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=barathiraja@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com. [2607:f8b0:4864:20::112b])
        by gmr-mx.google.com with ESMTPS id cc11-20020a05622a410b00b00403ea989befsi1548478qtb.1.2023.08.08.08.01.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) client-ip=2607:f8b0:4864:20::112b;
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-58411e24eefso62306387b3.1
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Aug 2023 08:01:58 -0700 (PDT)
X-Received: by 2002:a25:360a:0:b0:d4c:cbd2:f6f3 with SMTP id
 d10-20020a25360a000000b00d4ccbd2f6f3mr7930925yba.53.1691506916405; Tue, 08
 Aug 2023 08:01:56 -0700 (PDT)
MIME-Version: 1.0
From: Bharathiraja Nallathambi <barathiraja@gmail.com>
Date: Tue, 8 Aug 2023 20:31:44 +0530
Message-ID: <CAGA=GbyPEO8Z9bAgpfRaAaFAg2sqHuvfEzCbCNCUguag4-Nfsg@mail.gmail.com>
Subject: Need help for jailhouse Linux demo on imx8mm board
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/mixed; boundary="000000000000e4a08b06026aa481"
X-Original-Sender: barathiraja@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=bwS8WGX9;       spf=pass
 (google.com: domain of barathiraja@gmail.com designates 2607:f8b0:4864:20::112b
 as permitted sender) smtp.mailfrom=barathiraja@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000e4a08b06026aa481
Content-Type: multipart/alternative; boundary="000000000000e4a08806026aa47f"

--000000000000e4a08806026aa47f
Content-Type: text/plain; charset="UTF-8"

Hi,
  I am trying to run jailhouse Linux demo on imx8mm board (
https://www.compulab.com/products/iot-gateways/iot-gate-imx8-industrial-arm-iot-gateway/
)

After the dts patch and kernel re-build, I am able to run the jailhouse
inmate demo (gic-demo.bin) without any issues.

When i tried to run jailhouse Linux demo on imx8mm board, i face the
following challenge,

#Enable Jailhouse:
export PATH=$PATH:/usr/share/jailhouse/tools
insmod /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/driver/jailhouse.ko
jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell
jailhouse cell list

#try to run Linux
jailhouse cell linux imx8mm-linux-demo.cell /home/root/jailhouse/vmlinux -d
/home/root/jailhouse/sb-iotgimx8.dtb -c "clk_ignore_unused
console=ttymxc2,115200 earlycon=ec_imx6q,0x30880000,115200 net.ifnames=0
root=/dev/sda2 rootwait rw"

imx8mm-linux-demo.cell - file attached for reference
sb-iotgimx8.dts - file attached for reference

#jailhouse console output
root@iot-gate-imx8:~/jailhouse# jailhouse console

Initializing Jailhouse hypervisor v0.2 on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/993, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 3... OK
 CPU 1... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:02.0 to cell "imx8mm"
Adding virtual PCI device 00:03.0 to cell "imx8mm"
Adding virtual PCI device 00:00.0 to cell "imx8mm"
Adding virtual PCI device 00:01.0 to cell "imx8mm"
Page pool usage after late setup: mem 63/993, remap 144/131072
Activating hypervisor
Adding virtual PCI device 00:02.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Adding virtual PCI device 00:03.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mm"
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 77/993, remap 144/131072

#jailhouse cell list output
#root@iot-gate-imx8:~/jailhouse# jailhouse cell list
ID      Name                    State             Assigned CPUs
Failed CPUs
0       imx8mm                  running           0-1

1       linux-inmate-demo       shut down         2-3

#/proc/cmdline
console=ttymxc2,115200 earlycon=ec_imx6q,0x30880000,115200 net.ifnames=0
root=/dev/mmcblk2p2 rootwait rw panic=5 oops=panic

#/proc/iomem
root@iot-gate-imx8:~/jailhouse# cat /proc/iomem
00100000-00107fff : 30900000.crypto caam-sm@100000
18000000-1fefffff : pcie@33800000
  18000000-180fffff : 0000:00:00.0
  18100000-181fffff : PCI Bus 0000:01
    18100000-18103fff : 0000:01:00.0
      18100000-18103fff : iwlwifi
  18200000-1820ffff : 0000:00:00.0
1ff00000-1ff7ffff : 33800000.pcie config
30200000-3020ffff : 30200000.gpio gpio@30200000
30210000-3021ffff : 30210000.gpio gpio@30210000
30220000-3022ffff : 30220000.gpio gpio@30220000
30230000-3023ffff : 30230000.gpio gpio@30230000
30240000-3024ffff : 30240000.gpio gpio@30240000
30260000-3026ffff : 30260000.tmu tmu@30260000
30280000-3028ffff : 30280000.watchdog watchdog@30280000
302b0000-302bffff : 302b0000.dma-controller dma-controller@302b0000
302c0000-302cffff : 302c0000.dma-controller dma-controller@302c0000
30330000-3033ffff : 30330000.pinctrl pinctrl@30330000
30350000-3035ffff : 30350000.efuse efuse@30350000
30380000-3038ffff : 30380000.clock-controller clock-controller@30380000
30820000-3082ffff : 30820000.spi spi@30820000
30860000-3086ffff : 30860000.serial serial@30860000
30880000-3088ffff : 30880000.serial serial@30880000
30900000-3093ffff : 30900000.crypto crypto@30900000
30a20000-30a2ffff : 30a20000.i2c i2c@30a20000
30a30000-30a3ffff : 30a30000.i2c i2c@30a30000
30a60000-30a6ffff : 30a60000.serial serial@30a60000
30aa0000-30aaffff : 30aa0000.mailbox mailbox@30aa0000
30b50000-30b5ffff : 30b50000.mmc mmc@30b50000
30b60000-30b6ffff : 30b60000.mmc mmc@30b60000
30bd0000-30bdffff : 30bd0000.dma-controller dma-controller@30bd0000
30be0000-30beffff : 30be0000.ethernet ethernet@30be0000
32e28000-32e28003 : 32e28000.dispmix-sft-rstn dispmix-sft-rstn@32e28000
32e28004-32e28007 : 32e28004.dispmix-clk-en dispmix-clk-en@32e28004
32e28008-32e2800b : 32e28008.dispmix-mipi-rst dispmix-mipi-rst@32e28008
32e40000-32e401ff : usb@32e40000
  32e40000-32e401ff : ci_hdrc.0 usb@32e40000
32e40200-32e403ff : 32e40200.usbmisc usbmisc@32e40200
32e50000-32e501ff : usb@32e50000
  32e50000-32e501ff : ci_hdrc.1 usb@32e50000
32e50200-32e503ff : 32e50200.usbmisc usbmisc@32e50200
32f00000-32f0ffff : 33800000.pcie pcie-phy@32f00000
33000000-33001fff : 33000000.dma-controller dma-controller@33000000
33800000-33bfffff : 33800000.pcie dbi
3d800000-3dbfffff : 3d800000.ddr-pmu ddr-pmu@3d800000
40000000-55ffffff : System RAM
  40610000-41ceffff : Kernel code
  41cf0000-4206ffff : reserved
  42070000-423bffff : Kernel data
  43000000-4300afff : reserved
58000000-93bfffff : System RAM
  6a000000-91ffffff : reserved
93c00000-b83fffff : reserved
  b7c00000-b7ffffff : Jailhouse hypervisor
b8400000-bb6fffff : System RAM
bb700000-bbbfffff : reserved
bbc00000-bfffffff : System RAM
  bd900000-bfbfffff : reserved
  bfc6d000-bfc6dfff : reserved
  bfc6e000-bfce5fff : reserved
  bfce8000-bfce9fff : reserved
  bfcea000-bfceafff : reserved
  bfceb000-bfcfefff : reserved
  bfcff000-bfcfffff : reserved
  bfd00000-bfd35fff : reserved
  bfd36000-bfffffff : reserved


#dts patch

From aaee5eb45ada7121c7c34af7049c0db11ea2b572 Mon Sep 17 00:00:00 2001
From: Bharathiraja Nallathambi <bharathiraja.nallathambi@xxxxxx.com>
Date: Mon, 31 Jul 2023 17:14:42 +0000
Subject: [PATCH] adding reserved memory for jailhouse

- adding reserved memory for jailhouse imx8mm

Signed-off-by: Bharathiraja Nallathambi <bharathiraja.nallathambi@xxxxxx.com
>
---
 arch/arm64/boot/dts/compulab/sb-iotgimx8.dts | 38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
index 08de87e55d0b..6539aa8c83f6 100644
--- a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
+++ b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts
@@ -315,3 +315,41 @@ MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20 0x140
  };
  };
 };
+
+&{/reserved-memory} {
+
+ ivshmem_reserved: ivshmem@bbb00000 {
+ no-map;
+ reg = <0 0xbbb00000 0x0 0x00100000>;
+ };
+
+ ivshmem2_reserved: ivshmem2@bba00000 {
+ no-map;
+ reg = <0 0xbba00000 0x0 0x00100000>;
+ };
+
+ pci_reserved: pci@bb800000 {
+ no-map;
+ reg = <0 0xbb800000 0x0 0x00200000>;
+ };
+
+ loader_reserved: loader@bb700000 {
+ no-map;
+ reg = <0 0xbb700000 0x0 0x00100000>;
+ };
+
+ jh_reserved: jh@b7c00000 {
+ no-map;
+ reg = <0 0xb7c00000 0x0 0x00400000>;
+ };
+
+ /* 512MB */
+ inmate_reserved: inmate@93c00000 {
+ no-map;
+ reg = <0 0x93c00000 0x0 0x24000000>;
+ };
+};
+
+&{/reserved-memory/linux,cma} {
+ alloc-ranges = <0 0x40000000 0 0x60000000>;
+};
-- 
2.34.1


There is no console output. The terminal froze.

Can someone help me here please.



-- 
Thanks and Regards,
Bharathiraja Nallathambi

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbyPEO8Z9bAgpfRaAaFAg2sqHuvfEzCbCNCUguag4-Nfsg%40mail.gmail.com.

--000000000000e4a08806026aa47f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>=C2=A0 I am trying to run jailhouse Linux demo on i=
mx8mm board (<a href=3D"https://www.compulab.com/products/iot-gateways/iot-=
gate-imx8-industrial-arm-iot-gateway/">https://www.compulab.com/products/io=
t-gateways/iot-gate-imx8-industrial-arm-iot-gateway/</a>)<div>=C2=A0 <br>Af=
ter the dts patch and kernel re-build, I am able to run the jailhouse inmat=
e demo (gic-demo.bin) without any issues.</div><div>=C2=A0 <br>When i tried=
 to run jailhouse Linux demo on imx8mm board, i face the following challeng=
e,<br><br>#Enable Jailhouse: =C2=A0<br>export PATH=3D$PATH:/usr/share/jailh=
ouse/tools<br>insmod /lib/modules/5.15.32-iot-gate-imx8m-3.2.1+/extra/drive=
r/jailhouse.ko <br>jailhouse enable /usr/share/jailhouse/cells/imx8mm.cell =
<br>jailhouse cell list<br><br>#try to run Linux<br>jailhouse cell linux im=
x8mm-linux-demo.cell /home/root/jailhouse/vmlinux -d /home/root/jailhouse/s=
b-iotgimx8.dtb -c &quot;clk_ignore_unused console=3Dttymxc2,115200 earlycon=
=3Dec_imx6q,0x30880000,115200 net.ifnames=3D0 root=3D/dev/sda2 rootwait rw&=
quot;<br><br>imx8mm-linux-demo.cell - file attached for reference<br>sb-iot=
gimx8.dts - file attached for reference<br><br>#jailhouse console output<br=
>root@iot-gate-imx8:~/jailhouse# jailhouse console<br><br>Initializing Jail=
house hypervisor v0.2 on CPU 0<br>Code location: 0x0000ffffc0200800<br>Page=
 pool usage after early setup: mem 39/993, remap 0/131072<br>Initializing p=
rocessors:<br>=C2=A0CPU 0... OK<br>=C2=A0CPU 3... OK<br>=C2=A0CPU 1... OK<b=
r>=C2=A0CPU 2... OK<br>Initializing unit: irqchip<br>Initializing unit: ARM=
 SMMU v3<br>Initializing unit: ARM SMMU<br>Initializing unit: PVU IOMMU<br>=
Initializing unit: PCI<br>Adding virtual PCI device 00:02.0 to cell &quot;i=
mx8mm&quot;<br>Adding virtual PCI device 00:03.0 to cell &quot;imx8mm&quot;=
<br>Adding virtual PCI device 00:00.0 to cell &quot;imx8mm&quot;<br>Adding =
virtual PCI device 00:01.0 to cell &quot;imx8mm&quot;<br>Page pool usage af=
ter late setup: mem 63/993, remap 144/131072<br>Activating hypervisor<br>Ad=
ding virtual PCI device 00:02.0 to cell &quot;linux-inmate-demo&quot;<br>Sh=
ared memory connection established, peer cells:<br>=C2=A0&quot;imx8mm&quot;=
<br>Adding virtual PCI device 00:03.0 to cell &quot;linux-inmate-demo&quot;=
<br>Shared memory connection established, peer cells:<br>=C2=A0&quot;imx8mm=
&quot;<br>Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo=
&quot;<br>Shared memory connection established, peer cells:<br>=C2=A0&quot;=
imx8mm&quot;<br>Adding virtual PCI device 00:01.0 to cell &quot;linux-inmat=
e-demo&quot;<br>Shared memory connection established, peer cells:<br>=C2=A0=
&quot;imx8mm&quot;<br>Created cell &quot;linux-inmate-demo&quot;<br>Page po=
ol usage after cell creation: mem 77/993, remap 144/131072<br><br>#jailhous=
e cell list output<br>#root@iot-gate-imx8:~/jailhouse# jailhouse cell list<=
br>ID =C2=A0 =C2=A0 =C2=A0Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0State =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Assigned CPUs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Failed CPUs =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>0 =C2=A0 =C2=A0 =C2=A0 imx8mm =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0running =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0-1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>1 =C2=A0 =C2=A0 =C2=A0 linux-inmate-demo =
=C2=A0 =C2=A0 =C2=A0 shut down =C2=A0 =C2=A0 =C2=A0 =C2=A0 2-3 <br><br>#/pr=
oc/cmdline<br>console=3Dttymxc2,115200 earlycon=3Dec_imx6q,0x30880000,11520=
0 net.ifnames=3D0 root=3D/dev/mmcblk2p2 rootwait rw panic=3D5 oops=3Dpanic<=
br><br>#/proc/iomem<br>root@iot-gate-imx8:~/jailhouse# cat /proc/iomem <br>=
00100000-00107fff : 30900000.crypto caam-sm@100000<br>18000000-1fefffff : p=
cie@33800000<br>=C2=A0 18000000-180fffff : 0000:00:00.0<br>=C2=A0 18100000-=
181fffff : PCI Bus 0000:01<br>=C2=A0 =C2=A0 18100000-18103fff : 0000:01:00.=
0<br>=C2=A0 =C2=A0 =C2=A0 18100000-18103fff : iwlwifi<br>=C2=A0 18200000-18=
20ffff : 0000:00:00.0<br>1ff00000-1ff7ffff : 33800000.pcie config<br>302000=
00-3020ffff : 30200000.gpio gpio@30200000<br>30210000-3021ffff : 30210000.g=
pio gpio@30210000<br>30220000-3022ffff : 30220000.gpio gpio@30220000<br>302=
30000-3023ffff : 30230000.gpio gpio@30230000<br>30240000-3024ffff : 3024000=
0.gpio gpio@30240000<br>30260000-3026ffff : 30260000.tmu tmu@30260000<br>30=
280000-3028ffff : 30280000.watchdog watchdog@30280000<br>302b0000-302bffff =
: 302b0000.dma-controller dma-controller@302b0000<br>302c0000-302cffff : 30=
2c0000.dma-controller dma-controller@302c0000<br>30330000-3033ffff : 303300=
00.pinctrl pinctrl@30330000<br>30350000-3035ffff : 30350000.efuse efuse@303=
50000<br>30380000-3038ffff : 30380000.clock-controller clock-controller@303=
80000<br>30820000-3082ffff : 30820000.spi spi@30820000<br>30860000-3086ffff=
 : 30860000.serial serial@30860000<br>30880000-3088ffff : 30880000.serial s=
erial@30880000<br>30900000-3093ffff : 30900000.crypto crypto@30900000<br>30=
a20000-30a2ffff : 30a20000.i2c i2c@30a20000<br>30a30000-30a3ffff : 30a30000=
.i2c i2c@30a30000<br>30a60000-30a6ffff : 30a60000.serial serial@30a60000<br=
>30aa0000-30aaffff : 30aa0000.mailbox mailbox@30aa0000<br>30b50000-30b5ffff=
 : 30b50000.mmc mmc@30b50000<br>30b60000-30b6ffff : 30b60000.mmc mmc@30b600=
00<br>30bd0000-30bdffff : 30bd0000.dma-controller dma-controller@30bd0000<b=
r>30be0000-30beffff : 30be0000.ethernet ethernet@30be0000<br>32e28000-32e28=
003 : 32e28000.dispmix-sft-rstn dispmix-sft-rstn@32e28000<br>32e28004-32e28=
007 : 32e28004.dispmix-clk-en dispmix-clk-en@32e28004<br>32e28008-32e2800b =
: 32e28008.dispmix-mipi-rst dispmix-mipi-rst@32e28008<br>32e40000-32e401ff =
: usb@32e40000<br>=C2=A0 32e40000-32e401ff : ci_hdrc.0 usb@32e40000<br>32e4=
0200-32e403ff : 32e40200.usbmisc usbmisc@32e40200<br>32e50000-32e501ff : us=
b@32e50000<br>=C2=A0 32e50000-32e501ff : ci_hdrc.1 usb@32e50000<br>32e50200=
-32e503ff : 32e50200.usbmisc usbmisc@32e50200<br>32f00000-32f0ffff : 338000=
00.pcie pcie-phy@32f00000<br>33000000-33001fff : 33000000.dma-controller dm=
a-controller@33000000<br>33800000-33bfffff : 33800000.pcie dbi<br>3d800000-=
3dbfffff : 3d800000.ddr-pmu ddr-pmu@3d800000<br>40000000-55ffffff : System =
RAM<br>=C2=A0 40610000-41ceffff : Kernel code<br>=C2=A0 41cf0000-4206ffff :=
 reserved<br>=C2=A0 42070000-423bffff : Kernel data<br>=C2=A0 43000000-4300=
afff : reserved<br>58000000-93bfffff : System RAM<br>=C2=A0 6a000000-91ffff=
ff : reserved<br>93c00000-b83fffff : reserved<br>=C2=A0 b7c00000-b7ffffff :=
 Jailhouse hypervisor<br>b8400000-bb6fffff : System RAM<br>bb700000-bbbffff=
f : reserved<br>bbc00000-bfffffff : System RAM<br>=C2=A0 bd900000-bfbfffff =
: reserved<br>=C2=A0 bfc6d000-bfc6dfff : reserved<br>=C2=A0 bfc6e000-bfce5f=
ff : reserved<br>=C2=A0 bfce8000-bfce9fff : reserved<br>=C2=A0 bfcea000-bfc=
eafff : reserved<br>=C2=A0 bfceb000-bfcfefff : reserved<br>=C2=A0 bfcff000-=
bfcfffff : reserved<br>=C2=A0 bfd00000-bfd35fff : reserved<br>=C2=A0 bfd360=
00-bfffffff : reserved<br><br><br>#dts patch<br><br>From aaee5eb45ada7121c7=
c34af7049c0db11ea2b572 Mon Sep 17 00:00:00 2001<br>From: Bharathiraja Nalla=
thambi &lt;<a href=3D"mailto:bharathiraja.nallathambi@xxxxxx.com">bharathir=
aja.nallathambi@xxxxxx.com</a>&gt;<br>Date: Mon, 31 Jul 2023 17:14:42 +0000=
<br>Subject: [PATCH] adding reserved memory for jailhouse<br><br>- adding r=
eserved memory for jailhouse imx8mm<br><br>Signed-off-by: Bharathiraja Nall=
athambi &lt;<a href=3D"mailto:bharathiraja.nallathambi@xxxxxx.com">bharathi=
raja.nallathambi@xxxxxx.com</a>&gt;<br>---<br>=C2=A0arch/arm64/boot/dts/com=
pulab/sb-iotgimx8.dts | 38 ++++++++++++++++++++<br>=C2=A01 file changed, 38=
 insertions(+)<br><br>diff --git a/arch/arm64/boot/dts/compulab/sb-iotgimx8=
.dts b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<br>index 08de87e55d0b..=
6539aa8c83f6 100644<br>--- a/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<b=
r>+++ b/arch/arm64/boot/dts/compulab/sb-iotgimx8.dts<br>@@ -315,3 +315,41 @=
@ MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20	0x140<br>=C2=A0		};<br>=C2=A0	};<br>=C2=
=A0};<br>+<br>+&amp;{/reserved-memory} {<br>+<br>+	ivshmem_reserved: ivshme=
m@bbb00000 {<br>+		no-map;<br>+		reg =3D &lt;0 0xbbb00000 0x0 0x00100000&gt=
;;<br>+	};<br>+<br>+	ivshmem2_reserved: ivshmem2@bba00000 {<br>+		no-map;<b=
r>+		reg =3D &lt;0 0xbba00000 0x0 0x00100000&gt;;<br>+	};<br>+<br>+	pci_res=
erved: pci@bb800000 {<br>+		no-map;<br>+		reg =3D &lt;0 0xbb800000 0x0 0x00=
200000&gt;;<br>+	};<br>+<br>+	loader_reserved: loader@bb700000 {<br>+		no-m=
ap;<br>+		reg =3D &lt;0 0xbb700000 0x0 0x00100000&gt;;<br>+	};<br>+<br>+	jh=
_reserved: jh@b7c00000 {<br>+		no-map;<br>+		reg =3D &lt;0 0xb7c00000 0x0 0=
x00400000&gt;;<br>+	};<br>+<br>+	/* 512MB */<br>+	inmate_reserved: inmate@9=
3c00000 {<br>+		no-map;<br>+		reg =3D &lt;0 0x93c00000 0x0 0x24000000&gt;;<=
br>+	};<br>+};<br>+<br>+&amp;{/reserved-memory/linux,cma} {<br>+	alloc-rang=
es =3D &lt;0 0x40000000 0 0x60000000&gt;;<br>+};<br>-- <br>2.34.1<br><br><b=
r>There is no console output. The terminal froze.<br><br>Can someone help m=
e here please.<br>=C2=A0 <br>=C2=A0 <br><div><br></div><span class=3D"gmail=
_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks and Regards,<di=
v>Bharathiraja Nallathambi</div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGA%3DGbyPEO8Z9bAgpfRaAaFAg2sqHuvfEzCbCNCUguag4-N=
fsg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGA%3DGbyPEO8Z9bAgpfRaAaFAg2sqHuvfEzCbCN=
CUguag4-Nfsg%40mail.gmail.com</a>.<br />

--000000000000e4a08806026aa47f--
--000000000000e4a08b06026aa481
Content-Type: text/x-csrc; charset="US-ASCII"; name="imx8mm-linux-demo.c"
Content-Disposition: attachment; filename="imx8mm-linux-demo.c"
Content-Transfer-Encoding: base64
Content-ID: <f_ll2fi2uy0>
X-Attachment-Id: f_ll2fi2uy0

LyoKICogaU1YOE1NIHRhcmdldCAtIGxpbnV4LWRlbW8KICoKICogQ29weXJpZ2h0IDIwMjAgTlhQ
CiAqCiAqIEF1dGhvcnM6CiAqICBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KICoKICogVGhp
cyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lv
biAyLiAgU2VlCiAqIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3Rvcnku
CiAqLwovKgogKiBCb290IDJuZCBMaW51eCBjbWRsaW5lOgogKiBleHBvcnQgUEFUSD0kUEFUSDov
dXNyL3NoYXJlL2phaWxob3VzZS90b29scy8KICogamFpbGhvdXNlIGNlbGwgbGludXggaW14OG1t
LWxpbnV4LWRlbW8uY2VsbCBJbWFnZSAtZCBmc2wtaW14OG1tLWV2ay1pbm1hdGUuZHRiIC1jICJj
bGtfaWdub3JlX3VudXNlZCBjb25zb2xlPXR0eW14YzMsMTE1MjAwIGVhcmx5Y29uPWVjX2lteDZx
LDB4MzA4OTAwMDAsMTE1MjAwICByb290PS9kZXYvbW1jYmxrMnAyIHJvb3R3YWl0IHJ3IgogKi8K
I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syM107CglzdHJ1
Y3QgamFpbGhvdXNlX2lycWNoaXAgaXJxY2hpcHNbMl07CglzdHJ1Y3QgamFpbGhvdXNlX3BjaV9k
ZXZpY2UgcGNpX2RldmljZXNbNF07Cn0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgY29uZmlnID0g
ewoJLmNlbGwgPSB7CgkJLnNpZ25hdHVyZSA9IEpBSUxIT1VTRV9DRUxMX0RFU0NfU0lHTkFUVVJF
LAoJCS5yZXZpc2lvbiA9IEpBSUxIT1VTRV9DT05GSUdfUkVWSVNJT04sCgkJLm5hbWUgPSAibGlu
dXgtaW5tYXRlLWRlbW8iLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1BBU1NJVkVfQ09NTVJF
RywKCgkJLmNwdV9zZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJLm51bV9tZW1vcnlf
cmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLm1lbV9yZWdpb25zKSwKCQkubnVtX2lycWNoaXBz
ID0gQVJSQVlfU0laRShjb25maWcuaXJxY2hpcHMpLAoJCS5udW1fcGNpX2RldmljZXMgPSBBUlJB
WV9TSVpFKGNvbmZpZy5wY2lfZGV2aWNlcyksCgkJLnZwY2lfaXJxX2Jhc2UgPSA3NCwgLyogTm90
IGluY2x1ZGUgMzIgYmFzZSAqLwoJfSwKCgkuY3B1cyA9IHsKCQkweGMsCgl9LAoKCS5tZW1fcmVn
aW9ucyA9IHsKCQkvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9uICh2aXJ0aW8tYmxrIGZy
b250KSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGJiYTAwMDAwLAoJCQkudmlydF9zdGFydCA9
IDB4YmJhMDAwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVN
X1JFQUQgfCBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsCgkJfSwKCQl7CgkJCS5waHlzX3N0YXJ0
ID0gMHhiYmEwMTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGJiYTAxMDAwLAoJCQkuc2l6ZSA9IDB4
ZGYwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJ
VEUgfAoJCQkJSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJCX0sCgkJeyAwIH0sCgkJeyAwIH0s
CgkJLyogSVZTSE1FTSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiAodmlydGlvLWNvbiBmcm9udCkgKi8K
CQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhiYmFlMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGJiYWUw
MDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwg
SkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJCX0sCgkJewoJCQkucGh5c19zdGFydCA9IDB4YmJh
ZTEwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhiYmFlMTAwMCwKCQkJLnNpemUgPSAweGYwMDAsCgkJ
CS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJ
SkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJCX0sCgkJeyAwIH0sCgkJeyAwIH0sCgkJLyogSVZI
U01FTSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiBmb3IgMDA6MDAuMCAoZGVtbyApKi8KCQl7CgkJCS5w
aHlzX3N0YXJ0ID0gMHhiYmFmMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGJiYWYwMDAwLAoJCQku
c2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNF
X01FTV9ST09UU0hBUkVELAoJCX0sCgkJewoJCQkucGh5c19zdGFydCA9IDB4YmJhZjEwMDAsCgkJ
CS52aXJ0X3N0YXJ0ID0gMHhiYmFmMTAwMCwKCQkJLnNpemUgPSAweDkwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNF
X01FTV9ST09UU0hBUkVELAoJCX0sCgkJewoJCQkucGh5c19zdGFydCA9IDB4YmJhZmEwMDAsCgkJ
CS52aXJ0X3N0YXJ0ID0gMHhiYmFmYTAwMCwKCQkJLnNpemUgPSAweDIwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCwKCQl9LAoJCXsK
CQkJLnBoeXNfc3RhcnQgPSAweGJiYWZjMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YmJhZmMwMDAs
CgkJCS5zaXplID0gMHgyMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1JPT1RTSEFSRUQsCgkJfSwKCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhiYmFmZTAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAweGJiYWZlMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlM
SE9VU0VfTUVNX1JPT1RTSEFSRUQsCgkJfSwKCQkvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVn
aW9ucyBmb3IgMDA6MDEuMCAobmV0d29ya2luZykgKi8KCQlKQUlMSE9VU0VfU0hNRU1fTkVUX1JF
R0lPTlMoMHhiYmIwMDAwMCwgMSksCgkKCQkvKiBVQVJUNCAqLyB7CgkJCS5waHlzX3N0YXJ0ID0g
MHgzMGE2MDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDMwYTYwMDAwLAoJCQkuc2l6ZSA9IDB4MTAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8
CgkJCQlKQUlMSE9VU0VfTUVNX0lPIHwgSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJCX0sCgkJ
LyogU0hEQzEgKi8gewoJCQkucGh5c19zdGFydCA9IDB4MzBiNTAwMDAsCgkJCS52aXJ0X3N0YXJ0
ID0gMHgzMGI1MDAwMCwKCQkJLnNpemUgPSAweDEwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fSU8sCgkJ
fSwKCQkvKiBSQU06IFRvcCBhdCA0R0IgU3BhY2UgKi8gewoJCQkucGh5c19zdGFydCA9IDB4YmI3
MDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMCwKCQkJLnNpemUgPSAweDEwMDAwLCAvKiA2NEtCICov
CgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJ
CQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9MT0FEQUJMRSwKCQl9LAoJ
CS8qIFJBTSAqLyB7CgkJCS8qCgkJCSAqIFdlIGNvdWxkIG5vdCB1c2UgMHg4MDAwMDAwMCB3aGlj
aCBjb25mbGljdHMgd2l0aAoJCQkgKiBDT01NX1JFR0lPTl9CQVNFCgkJCSAqLwoJCQkucGh5c19z
dGFydCA9IDB4OTNjMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg5M2MwMDAwMCwKCQkJLnNpemUg
PSAweDI0MDAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0Vf
TUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1B
IHwKCQkJCUpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0aW9uIHJl
Z2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHg4MDAwMDAwMCwKCQkJLnNpemUgPSAweDAwMDAx
MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRF
IHwKCQkJCUpBSUxIT1VTRV9NRU1fQ09NTV9SRUdJT04sCgkJfSwKCX0sCgoJLmlycWNoaXBzID0g
ewoJCS8qIHVhcnQyL3NkaGMxICovIHsKCQkJLmFkZHJlc3MgPSAweDM4ODAwMDAwLAoJCQkucGlu
X2Jhc2UgPSAzMiwKCQkJLnBpbl9iaXRtYXAgPSB7CgkJCQkoMSA8PCAoMjQgKyAzMiAtIDMyKSkg
fCAoMSA8PCAoMjkgKyAzMiAtIDMyKSkKCQkJfSwKCQl9LAoJCS8qIElWU0hNRU0gKi8gewoJCQku
YWRkcmVzcyA9IDB4Mzg4MDAwMDAsCgkJCS5waW5fYmFzZSA9IDk2LAoJCQkucGluX2JpdG1hcCA9
IHsKCQkJCTB4ZiA8PCAoNzQgKyAzMiAtIDk2KQoJCQl9LAoJCX0sCgl9LAoKCS5wY2lfZGV2aWNl
cyA9IHsKCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0lWU0hNRU0sCgkJCS5kb21h
aW4gPSAxLAoJCQkuYmRmID0gMiA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9VU0VfSVZTSE1F
TV9CQVJfTUFTS19JTlRYLAoJCQkuc2htZW1fcmVnaW9uc19zdGFydCA9IDAsCgkJCS5zaG1lbV9k
ZXZfaWQgPSAxLAoJCQkuc2htZW1fcGVlcnMgPSAyLAoJCQkuc2htZW1fcHJvdG9jb2wgPSBKQUlM
SE9VU0VfU0hNRU1fUFJPVE9fVklSVElPX0ZST05UICsKCQkJCVZJUlRJT19ERVZfQkxPQ0ssCgkJ
fSwKCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0lWU0hNRU0sCgkJCS5kb21haW4g
PSAxLAoJCQkuYmRmID0gMyA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9VU0VfSVZTSE1FTV9C
QVJfTUFTS19JTlRYLAoJCQkuc2htZW1fcmVnaW9uc19zdGFydCA9IDQsCgkJCS5zaG1lbV9kZXZf
aWQgPSAxLAoJCQkuc2htZW1fcGVlcnMgPSAyLAoJCQkuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9V
U0VfU0hNRU1fUFJPVE9fVklSVElPX0ZST05UICsKCQkJCVZJUlRJT19ERVZfQ09OU09MRSwKCQl9
LAoJCXsgLyogSVZTSE1FTSAwMDowMC4wIChkZW1vKSAqLwoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9JVlNITUVNLAoJCQkuZG9tYWluID0gMSwKCQkJLmJkZiA9IDAgPDwgMywKCQkJLmJh
cl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfSU5UWCwKCQkJLnNobWVtX3JlZ2lv
bnNfc3RhcnQgPSA4LAoJCQkuc2htZW1fZGV2X2lkID0gMiwKCQkJLnNobWVtX3BlZXJzID0gMywK
CQkJLnNobWVtX3Byb3RvY29sID0gSkFJTEhPVVNFX1NITUVNX1BST1RPX1VOREVGSU5FRCwKCQl9
LAoJCXsgLyogSVZTSE1FTSAwMDowMS4wIChuZXR3b3JraW5nKSAqLwoJCQkudHlwZSA9IEpBSUxI
T1VTRV9QQ0lfVFlQRV9JVlNITUVNLAoJCQkuZG9tYWluID0gMSwKCQkJLmJkZiA9IDEgPDwgMywK
CQkJLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfSU5UWCwKCQkJLnNobWVt
X3JlZ2lvbnNfc3RhcnQgPSAxMywKCQkJLnNobWVtX2Rldl9pZCA9IDEsCgkJCS5zaG1lbV9wZWVy
cyA9IDIsCgkJCS5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19WRVRILAoJ
CX0sCgl9LAp9Owo=
--000000000000e4a08b06026aa481
Content-Type: audio/vnd.dts; name="sb-iotgimx8.dts"
Content-Disposition: attachment; filename="sb-iotgimx8.dts"
Content-Transfer-Encoding: base64
Content-ID: <f_ll2fi2vn1>
X-Attachment-Id: f_ll2fi2vn1

LyoKICogQ29weXJpZ2h0IChDKSAyMDIwIENvbXB1TGFiIEx0ZC4KICoKICogVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogKiBtb2Rp
ZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQog
KiBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMgogKiBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4KICoKICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCiAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRO
RVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gU2VlIHRoZQogKiBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgogKi8KCiNpbmNsdWRlICJ1Y20taW14OG0tbWlu
aS5kdHMiCgovIHsKCW1vZGVsID0gIkNvbXB1TGFiIFNCLUlPVEdJTVg4IGJvYXJkIjsKCWNvbXBh
dGlibGUgPSAic2ItaW90Z2lteDgiLCAiY3BsLHVjbS1pbXg4bS1taW5pIiwgImZzbCxpbXg4bW0i
OwoKCXJlZ3VsYXRvci11c2ItcG9ydHMtcHdyb24gewoJCWNvbXBhdGlibGUgPSAicmVndWxhdG9y
LWZpeGVkIjsKCQlyZWd1bGF0b3ItbmFtZSA9ICJ1c2JfcG9ydHNfcHdyb24iOwoJCXJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0g
PDMzMDAwMDA+OwoJCWdwaW8gPSA8JmdwaW80IDI4IEdQSU9fQUNUSVZFX0hJR0g+OwoJCXJlZ3Vs
YXRvci1hbHdheXMtb247CgkJZW5hYmxlLWFjdGl2ZS1oaWdoOwoJCXJlZ3VsYXRvci1ib290LW9u
OwoJfTsKCglyZWd1bGF0b3ItdXNiaHViLXJzdCB7CgkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3It
Zml4ZWQiOwoJCXJlZ3VsYXRvci1uYW1lID0gInVzYmh1Yl9yc3QiOwoJCXJlZ3VsYXRvci1taW4t
bWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAw
MDA+OwoJCWdwaW8gPSA8JmdwaW8zIDI0IEdQSU9fQUNUSVZFX0hJR0g+OwoJCXJlZ3VsYXRvci1h
bHdheXMtb247CgkJZW5hYmxlLWFjdGl2ZS1oaWdoOwoJfTsKCglyZWd1bGF0b3ItdWFydDEtbW9k
ZSB7CgkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwoJCXJlZ3VsYXRvci1uYW1lID0g
InVhcnQxX21vZGUiOwoJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCWdwaW8gPSA8JmdwaW80IDI2IEdQ
SU9fQUNUSVZFX0hJR0g+OwoJCWVuYWJsZS1hY3RpdmUtaGlnaDsKCQlyZWd1bGF0b3ItYWx3YXlz
LW9uOwoJfTsKCglyZWd1bGF0b3ItdWFydDEtZHVwbGV4IHsKCQljb21wYXRpYmxlID0gInJlZ3Vs
YXRvci1maXhlZCI7CgkJcmVndWxhdG9yLW5hbWUgPSAidWFydDFfZHVwbGV4IjsKCQlyZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsKCQlncGlvID0gPCZncGlvNCAyNyBHUElPX0FDVElWRV9ISUdIPjsKCQlyZWd1
bGF0b3ItYWx3YXlzLW9uOwoJCWVuYWJsZS1hY3RpdmUtaGlnaDsKCX07CgoJcmVndWxhdG9yLXVh
cnQxLXNoZG4gewoJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKCQlyZWd1bGF0b3It
bmFtZSA9ICJ1YXJ0MV9zaGRuIjsKCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAw
PjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCQlncGlvID0gPCZncGlv
NSA1IEdQSU9fQUNUSVZFX0hJR0g+OwoJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJZW5hYmxlLWFj
dGl2ZS1oaWdoOwoJfTsKCglyZWd1bGF0b3ItdWFydDEtdHJtZW4gewoJCWNvbXBhdGlibGUgPSAi
cmVndWxhdG9yLWZpeGVkIjsKCQlyZWd1bGF0b3ItbmFtZSA9ICJ1YXJ0MV90cm1lbiI7CgkJcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3Zv
bHQgPSA8MzMwMDAwMD47CgkJZ3BpbyA9IDwmZ3BpbzQgMjUgR1BJT19BQ1RJVkVfTE9XPjsKCQly
ZWd1bGF0b3ItYWx3YXlzLW9uOwoJCWVuYWJsZS1hY3RpdmUtbG93OwoJfTsKCglyZWd1bGF0b3It
dXNkaGMyX3YgewoJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKCQlyZWd1bGF0b3It
bmFtZSA9ICJ1c2RoYzJfdiI7CgkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47
CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CgkJZ3BpbyA9IDwmZ3BpbzEg
NCBHUElPX0FDVElWRV9ISUdIPjsKCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwoJCWVuYWJsZS1hY3Rp
dmUtaGlnaDsKCX07CgoJcmVnX3VzZGhjMl9yc3Q6IHJlZ3VsYXRvci11c2RoYzJfcnN0IHsKCQlj
b21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKCQlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfcmVnX3VzZGhjMl9yc3Q+OwoJCXJlZ3VsYXRvci1u
YW1lID0gInVzZGhjMl9yc3QiOwoJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+
OwoJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCWdwaW8gPSA8JmdwaW8y
IDE5IEdQSU9fQUNUSVZFX0hJR0g+OwoJCXN0YXJ0dXAtZGVsYXktdXMgPSA8MTAwPjsKCQlvZmYt
b24tZGVsYXktdXMgPSA8MTIwMDA+OwoJCWVuYWJsZS1hY3RpdmUtaGlnaDsKCX07CgoJcmVndWxh
dG9yLW1wY2llMl9yc3QgewoJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKCQlyZWd1
bGF0b3ItbmFtZSA9ICJtcGNpZTJfcnN0IjsKCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwz
MzAwMDAwPjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCQlncGlvID0g
PCZncGlvMyAyMiBHUElPX0FDVElWRV9ISUdIPjsKCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwoJCWVu
YWJsZS1hY3RpdmUtaGlnaDsKCX07CgoJcmVndWxhdG9yLW1wY2llMmxvcmFfZGlzIHsKCQljb21w
YXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CgkJcmVndWxhdG9yLW5hbWUgPSAibXBjaWUybG9y
YV9kaXMiOwoJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCWdwaW8gPSA8JmdwaW8zIDIxIEdQSU9fQUNU
SVZFX0hJR0g+OwoJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJZW5hYmxlLWFjdGl2ZS1oaWdoOwoJ
fTsKCglwY2llMF9yZWZjbGs6IHBjaWUwLXJlZmNsayB7CgkJY29tcGF0aWJsZSA9ICJmaXhlZC1j
bG9jayI7CgkJI2Nsb2NrLWNlbGxzID0gPDA+OwoJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDAw
MDA+OwoJfTsKfTsKCiZ1YXJ0MSB7CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJcGluY3Ry
bC0wID0gPCZwaW5jdHJsX3VhcnQxICZwaW5jdHJsX3VhcnQxX2dwaW8+OwoJYXNzaWduZWQtY2xv
Y2tzID0gPCZjbGsgSU1YOE1NX0NMS19VQVJUMT47Cglhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0g
PCZjbGsgSU1YOE1NX1NZU19QTEwxXzgwTT47CglsaW51eCxyczQ4NS1lbmFibGVkLWF0LWJvb3Qt
dGltZTsKCXJzNDg1LXJ0cy1hY3RpdmUtaGlnaDsKCXJ0cy1ncGlvcyA9IDwmZ3BpbzQgMjQgR1BJ
T19BQ1RJVkVfTE9XPjsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMmMxIHsKCWNsb2NrLWZyZXF1
ZW5jeSA9IDwxMDAwMDA+OwoJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCXBpbmN0cmwtMCA9
IDwmcGluY3RybF9pMmMxPjsKCXN0YXR1cyA9ICJva2F5IjsKCgllZXByb21ANTQgewoJCWNvbXBh
dGlibGUgPSAiYXRtZWwsMjRjMDgiOwoJCXJlZyA9IDwweDU0PjsKCQlwYWdlc2l6ZSA9IDwxNj47
Cgl9Owp9OwoKJmVjc3BpMSB7CgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0g
PDA+OwoJZnNsLHNwaS1udW0tY2hpcHNlbGVjdHMgPSA8MT47CglwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOwoJcGluY3RybC0wID0gPCZwaW5jdHJsX2Vjc3BpMSAmcGluY3RybF9lY3NwaTFfY3M+
OwoJY3MtZ3Bpb3MgPSA8JmdwaW81IDkgR1BJT19BQ1RJVkVfTE9XPjsKCXN0YXR1cyA9ICJva2F5
IjsKfTsKCiZ1YXJ0NCB7CgkvZGVsZXRlLW5vZGUvIGJsdWV0b290aDsKfTsKCiZ1c2JvdGcxIHsK
CWRyX21vZGUgPSAiaG9zdCI7CglkaXNhYmxlLW92ZXItY3VycmVudDsKCXN0YXR1cyA9ICJva2F5
IjsKfTsKCiZ1c2JvdGcyIHsKCWRyX21vZGUgPSAiaG9zdCI7CglkaXNhYmxlLW92ZXItY3VycmVu
dDsKCXN0YXR1cyA9ICJva2F5IjsKCgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxz
ID0gPDA+OwoKCXVzYjk1MTRAMSB7CgkJY29tcGF0aWJsZSA9ICJ1c2I0MjQsOTUxNCI7CgkJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdXNiOTUxND47
CgkJcmVnID0gPDE+OwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDA+
OwoKCQlldGhlcm5ldDogdXNiZXRoZXJAMSB7CgkJCWNvbXBhdGlibGUgPSAidXNiNDI0LGVjMDAi
OwoJCQlyZWcgPSA8MT47CgkJfTsKCX07Cn07CgomdXNkaGMxIHsKCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7Cn07CgomdXNkaGMyIHsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CglwaW5jdHJsLTAg
PSA8JnBpbmN0cmxfdXNkaGMyPjsKCWJ1cy13aWR0aCA9IDw0PjsKCW1tYy1kZHItMV84djsKCW5v
LW1tYy1oczQwMDsKCW5vbi1yZW1vdmFibGU7Cgl2bW1jLXN1cHBseSA9IDwmcmVnX3VzZGhjMl9y
c3Q+OwoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnBjaWUwIHsKCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7CglwaW5jdHJsLTAgPSA8JnBpbmN0cmxfcGNpZTA+OwoJcmVzZXQtZ3BpbyA9IDwmZ3Bp
bzMgMjAgR1BJT19BQ1RJVkVfTE9XPjsKCWNsb2NrcyA9IDwmY2xrIElNWDhNTV9DTEtfUENJRTFf
Uk9PVD4sCgkJIDwmY2xrIElNWDhNTV9DTEtfUENJRTFfQVVYPiwKCQkgPCZjbGsgSU1YOE1NX0NM
S19QQ0lFMV9QSFk+LAoJCSA8JnBjaWUwX3JlZmNsaz47CgljbG9jay1uYW1lcyA9ICJwY2llIiwg
InBjaWVfYXV4IiwgInBjaWVfcGh5IiwgInBjaWVfYnVzIjsKCWFzc2lnbmVkLWNsb2NrcyA9IDwm
Y2xrIElNWDhNTV9DTEtfUENJRTFfQVVYPiwKCQkJICA8JmNsayBJTVg4TU1fQ0xLX1BDSUUxX1BI
WT4sCgkJCSAgPCZjbGsgSU1YOE1NX0NMS19QQ0lFMV9DVFJMPjsKCWFzc2lnbmVkLWNsb2NrLXJh
dGVzID0gPDEwMDAwMDAwPiwgPDEwMDAwMDAwMD4sIDwyNTAwMDAwMDA+OwoJYXNzaWduZWQtY2xv
Y2stcGFyZW50cyA9IDwmY2xrIElNWDhNTV9TWVNfUExMMl81ME0+LAoJCQkJIDwmY2xrIElNWDhN
TV9TWVNfUExMMl8xMDBNPiwKCQkJCSA8JmNsayBJTVg4TU1fU1lTX1BMTDJfMjUwTT47CglleHRf
b3NjID0gPDE+OwoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJmlvbXV4YyB7CglwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiOwoJcGluY3RybC0wID0gPCZwaW5jdHJsX2hvZ19zYl9pb3RnaW14OD47CgoJ
c2ItaW90Z2lteDggewoJCXBpbmN0cmxfaG9nX3NiX2lvdGdpbXg4OiBob2dncnBfc2ItaW90Z2lt
eDggewoJCQlmc2wscGlucyA9IDwKCQkJCS8qIG1QQ0llMiAqLwoJCQkJTVg4TU1fSU9NVVhDX1NB
STVfUlhEMF9HUElPM19JTzIxCTB4MTQwIC8qIG1QQ0llMl9MT1JBX0RJU0FCTEUgKi8KCQkJCU1Y
OE1NX0lPTVVYQ19TQUk1X1JYRDFfR1BJTzNfSU8yMgkweDE0MCAvKiBtUENJZTJfUEVSU1RuICov
CgkJCT47CgkJfTsKCgkJcGluY3RybF91YXJ0MTogdWFydDFncnAgewoJCQlmc2wscGlucyA9IDwK
CQkJCU1YOE1NX0lPTVVYQ19TQUkyX1JYQ19VQVJUMV9EQ0VfUlgJMHgxNDAKCQkJCU1YOE1NX0lP
TVVYQ19TQUkyX1JYRlNfVUFSVDFfRENFX1RYCTB4MTQwCgkJCQlNWDhNTV9JT01VWENfU0FJMl9U
WEZTX0dQSU80X0lPMjQJMHgxNDAgLyogUlRTICovCgkJCQlNWDhNTV9JT01VWENfU0FJMl9SWEQw
X1VBUlQxX0RDRV9SVFNfQgkweDE0MCAvKiBDVFMgKi8KCQkJPjsKCQl9OwoKCQlwaW5jdHJsX3Vh
cnQxX2dwaW86IHVhcnQxZ3Bpb2dycCB7CgkJCWZzbCxwaW5zID0gPAoJCQkJTVg4TU1fSU9NVVhD
X1NBSTJfVFhEMF9HUElPNF9JTzI2CTB4MDAwIC8qIFJTXzQ4NV8yMzJfU0VMICovCgkJCQlNWDhN
TV9JT01VWENfU0FJMl9NQ0xLX0dQSU80X0lPMjcJMHgxNDAgLyogUlNfNDg1X0gvRl9TRUwgKi8K
CQkJCU1YOE1NX0lPTVVYQ19TUERJRl9FWFRfQ0xLX0dQSU81X0lPNQkweDE0MCAvKiBTSEROICov
CgkJCQlNWDhNTV9JT01VWENfU0FJMl9UWENfR1BJTzRfSU8yNQkweDE0MCAvKiBSU180ODVfVFJN
RU4gKi8KCQkJPjsKCQl9OwoKCQlwaW5jdHJsX2kyYzE6IGkyYzFncnAgewoJCQlmc2wscGlucyA9
IDwKCQkJCU1YOE1NX0lPTVVYQ19JMkMxX1NDTF9JMkMxX1NDTAkJMHg0MDAwMDFjMwoJCQkJTVg4
TU1fSU9NVVhDX0kyQzFfU0RBX0kyQzFfU0RBCQkweDQwMDAwMWMzCgkJCT47CgkJfTsKCgkJcGlu
Y3RybF9lY3NwaTE6IGVjc3BpMWdycCB7CgkJCWZzbCxwaW5zID0gPAoJCQkJTVg4TU1fSU9NVVhD
X0VDU1BJMV9TQ0xLX0VDU1BJMV9TQ0xLCTB4ODIKCQkJCU1YOE1NX0lPTVVYQ19FQ1NQSTFfTU9T
SV9FQ1NQSTFfTU9TSQkweDgyCgkJCQlNWDhNTV9JT01VWENfRUNTUEkxX01JU09fRUNTUEkxX01J
U08JMHg4MgoJCQk+OwoJCX07CgoJCXBpbmN0cmxfZWNzcGkxX2NzOiBlY3NwaTFjcyB7CgkJCWZz
bCxwaW5zID0gPAoJCQkJTVg4TU1fSU9NVVhDX0VDU1BJMV9TUzBfR1BJTzVfSU85CTB4NDAwMDAK
CQkJPjsKCQl9OwoKCQlwaW5jdHJsX3VzYjk1MTQ6IHVzYjk1MTRncnAgewoJCQlmc2wscGlucyA9
IDwKCQkJCU1YOE1NX0lPTVVYQ19TQUkzX1JYRlNfR1BJTzRfSU8yOAkweDE0MCAvKiBVU0JfUFNf
RU4gKi8KCQkJCU1YOE1NX0lPTVVYQ19TQUk1X1JYRDNfR1BJTzNfSU8yNAkweDE0MCAvKiBIVUJf
UlNUbiAqLwoJCQk+OwoJCX07CgoJCXBpbmN0cmxfdXNkaGMyOiB1c2RoYzJncnAgewoJCQlmc2ws
cGlucyA9IDwKCQkJCU1YOE1NX0lPTVVYQ19TRDJfQ0xLX1VTREhDMl9DTEsJCTB4MTkwCgkJCQlN
WDhNTV9JT01VWENfU0QyX0NNRF9VU0RIQzJfQ01ECQkweDFkMAoJCQkJTVg4TU1fSU9NVVhDX1NE
Ml9EQVRBMF9VU0RIQzJfREFUQTAJMHgxZDAKCQkJCU1YOE1NX0lPTVVYQ19TRDJfREFUQTFfVVNE
SEMyX0RBVEExCTB4MWQwCgkJCQlNWDhNTV9JT01VWENfU0QyX0RBVEEyX1VTREhDMl9EQVRBMgkw
eDFkMAoJCQkJTVg4TU1fSU9NVVhDX1NEMl9EQVRBM19VU0RIQzJfREFUQTMJMHgxZDAKCQkJCU1Y
OE1NX0lPTVVYQ19HUElPMV9JTzA0X0dQSU8xX0lPNAkweDFkMCAvKiBTRDJfVlNFTCAqLwoJCQk+
OwoJCX07CgoJCXBpbmN0cmxfcmVnX3VzZGhjMl9yc3Q6IHVzZGhjMnJzdCB7CgkJCWZzbCxwaW5z
ID0gPAoJCQkJTVg4TU1fSU9NVVhDX1NEMl9SRVNFVF9CX0dQSU8yX0lPMTkJMHg0MSAgLyogRU1N
Q19SU1QgKi8KCQkJPjsKCQl9OwoKCQlwaW5jdHJsX3BjaWUwOiBwY2llMGdycCB7CgkJCWZzbCxw
aW5zID0gPAoJCQkJTVg4TU1fSU9NVVhDX1NBSTVfUlhDX0dQSU8zX0lPMjAJMHgxNDAKCQkJPjsK
CQl9OwoJfTsKfTsKCiZ7L3Jlc2VydmVkLW1lbW9yeX0gewoKCWl2c2htZW1fcmVzZXJ2ZWQ6IGl2
c2htZW1AYmJiMDAwMDAgewoJCW5vLW1hcDsKCQlyZWcgPSA8MCAweGJiYjAwMDAwIDB4MCAweDAw
MTAwMDAwPjsKCX07CgoJaXZzaG1lbTJfcmVzZXJ2ZWQ6IGl2c2htZW0yQGJiYTAwMDAwIHsKCQlu
by1tYXA7CgkJcmVnID0gPDAgMHhiYmEwMDAwMCAweDAgMHgwMDEwMDAwMD47Cgl9OwoKCXBjaV9y
ZXNlcnZlZDogcGNpQGJiODAwMDAwIHsKCQluby1tYXA7CgkJcmVnID0gPDAgMHhiYjgwMDAwMCAw
eDAgMHgwMDIwMDAwMD47Cgl9OwoKCWxvYWRlcl9yZXNlcnZlZDogbG9hZGVyQGJiNzAwMDAwIHsK
CQluby1tYXA7CgkJcmVnID0gPDAgMHhiYjcwMDAwMCAweDAgMHgwMDEwMDAwMD47Cgl9OwoKCWpo
X3Jlc2VydmVkOiBqaEBiN2MwMDAwMCB7CgkJbm8tbWFwOwoJCXJlZyA9IDwwIDB4YjdjMDAwMDAg
MHgwIDB4MDA0MDAwMDA+OwoJfTsKCgkvKiA1MTJNQiAqLwoJaW5tYXRlX3Jlc2VydmVkOiBpbm1h
dGVAOTNjMDAwMDAgewoJCW5vLW1hcDsKCQlyZWcgPSA8MCAweDkzYzAwMDAwIDB4MCAweDI0MDAw
MDAwPjsKCX07Cn07Cgomey9yZXNlcnZlZC1tZW1vcnkvbGludXgsY21hfSB7CglhbGxvYy1yYW5n
ZXMgPSA8MCAweDQwMDAwMDAwIDAgMHg2MDAwMDAwMD47Cn07Cg==
--000000000000e4a08b06026aa481--
