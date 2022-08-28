Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2PEV2MAMGQEN4ETVII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id D18735A3F14
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Aug 2022 20:22:34 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id br33-20020a056512402100b00494686d31f5sf660214lfb.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Aug 2022 11:22:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661710954; cv=pass;
        d=google.com; s=arc-20160816;
        b=opRPw0umwBRN1a9C1VgrryScGqWK+41CUtAeB4pWyEwDf8QrnYfN5+8eBPp92qpKs5
         v+JXbjw1SBdnzA+iHKDrZalpNottgwUjtYWd3zo3Jz3v+O+ldblpJZgOMPwggkjBFlCc
         ZmBIUxR6simgjy9jIIQ3sh+k9wkJz8f2en5Ri8/JPf/5sJ0IEQYuUSG/iy4EEDO9Pjv2
         F1S5DPSqKispjEg0RfCBpEdZCUgMD4dNbxxzNtvntdI4CdJ1iCkyRIgpH/9j29RKPOA0
         +OLYPTFpCLrCxZDNOhZLyJKmmU/ljXBlexOE0H3VNLTMz2Iz5u0LqexNoU/hdvUHsKBd
         d2aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=vG/z7drD1J/8HRr2WqKXjf91FOmx4HJzGH72tnN/ZPw=;
        b=BiSm3bO2JnLda0kxoBWBgHTXt+023SC4krlFtZ7MaIyBBFkjt6oebMQyBx+L6HEaTB
         Ps45hzb+gIbZz6Hb3CHQgP0u7qrIizoWFBurmXcxbrj2apuFpJ+VkSzPc1OwbwMPm65W
         aINdjePKLvtGEDaH5gMwF3qEYA8g2CrXZCZ1B/tmCDsGJUAgf03e2mbuiMyUbiJqoou8
         waJQR/To31S2GejWMHu1cn0mE745zormiIWTKo3AodWeVyr32l10JrQQ3JTU4S2ieIQD
         JSakGaGpDfSRT9AsFc7lyFIbh4xqHGf+kPrYCbQ0o6DMBc+unZZJKkEkKmKXdAk4N+rE
         07og==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="NV/BtH2w";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=vG/z7drD1J/8HRr2WqKXjf91FOmx4HJzGH72tnN/ZPw=;
        b=LO6DP3m1PjW2n54b9Em239usFUhKZc0nXFYa+4c2XeAewLrNLbs63P64KdWuew1bLK
         tlLslaM19VZ00payjPz60unyNS2jS5OtFhUQX3tCV1zQCL/zdEazuIK4q/VECwPgIRMY
         0kVBlzozj/GuzDlThx2UcNtnAnxCID/+kPtwZWdxWyC62e0mvn9wdXk5umJsabvr6CpF
         kfPLtBvLttmQ2L6gjI2xYYCIzEmjNv4oOhCbWZCfJOSQ1VTXc3GGgzrobOPgK6O468ME
         Rz5jkw9M0lPoTa+tI7MowbrfpGc0CgCNOjo26SJW23LWVWQG3Ax0yoF3lzZk3r3Fos54
         9goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc;
        bh=vG/z7drD1J/8HRr2WqKXjf91FOmx4HJzGH72tnN/ZPw=;
        b=QE5/bL5HghbadULybo/RUta81RS2T4HwKIuMW8CNClyclVyM8kcg1z6XaZxq1psc6Z
         dNfMfzHlyVXjPxBl5RM+HiCtVlv78ehjqeGOKwZwqG/q8yIDLjmw3OfhMck1e8NqWb5+
         /a+TL8qzLSJdCLaW9pHM+4J4GF9NmfJMyL1uS4ZiKyqjulK8hKr5VZMFWW5Z4k0UBfaJ
         pbUrbnYOTWj52X3NYY9H7X/3q0rdN5RKE6V3rifqNnNG9mkwf1kZLc4ve1Y5xTmKrpiz
         FNmKRe/H8G0Nv3sFLK8Xsy7yM3Wwx8WdJKKxmr7PrTe9sfmwNDAjKLewzLoOki/COvjS
         ebDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo25gTaGroa3BPxQvQAxJrvHNX7ifTotGtjjEhJFNpS54V9jQcOL
	G6WMDeyILuzBSJ4qJUvtLbE=
X-Google-Smtp-Source: AA6agR77qYLQ3V2tZWJR0P4i2sDF4vDIEOXI2PYMvc1Vr1IMwiLp77+2ElidCGqD37Ma4RQPhlN+KA==
X-Received: by 2002:a05:6512:e88:b0:48a:f6aa:84a7 with SMTP id bi8-20020a0565120e8800b0048af6aa84a7mr5495385lfb.395.1661710954431;
        Sun, 28 Aug 2022 11:22:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:995:b0:261:b5e5:82b6 with SMTP id
 b21-20020a05651c099500b00261b5e582b6ls1260812ljq.9.-pod-prod-gmail; Sun, 28
 Aug 2022 11:22:33 -0700 (PDT)
X-Received: by 2002:a2e:9681:0:b0:261:c515:2b13 with SMTP id q1-20020a2e9681000000b00261c5152b13mr4715381lji.210.1661710952935;
        Sun, 28 Aug 2022 11:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661710952; cv=none;
        d=google.com; s=arc-20160816;
        b=MB9qaB/aXBywZjLXz2yD2o3NyTN7OmJhF/Z2BF9YNdMS++twDhA4id8KFGFUcUtYG4
         SiZiMaZpFEdlye/Lhl9D3Ge7o2oEMi4orBrWkKkOkYhWpTyLWENeXtteMplRdVlwR8eJ
         /J1SiVAylu1Bf9MNPbkKzVRKKTAy/5NeIsiw30+OooCQweFEXfmPIAmB+IXCdw1JVjKE
         tGjymEnvIVvbIJRy6Wn2RrZ7ZJfKVDRL03xKAF3pyRYCJ842Kzl+HeYWBwuLdnLfDvjR
         wvNhdvO3DuQNyTpYkOb6jUGMwFNN4lVJtgLkG9AAxePRJkvfUAVc7dsyUArhB2yMGAXF
         UTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Scby8LzWy6mrDQ9r6r2tKMt3r5qxopRLVgUwubswhj8=;
        b=mt4+hrqNX84PEaPH8S8iZ+K5I4lMF++rEmqDjewDH2RitX9MGbcFj03t2SjDsMXS0E
         QY6qpHxM5alSn6UcHDK5qeTgxCFD9Wi7em4CPo1WHNTr/u09g/z8imHKCTjiGRZS5hQb
         FJj0QkRNfmfFauts5IcGO3ewUBVvdK5e7UwBEbB57HyuKyZOu30jNuIDMneow7cXtO10
         c8s5k6EVWawQjRGW0wSiBXjHNLQwgh5GS/ZF6KBMxmLieb06jPJe2go/cy3Fp9acutBR
         +Oz0nIee0Ha/6BlkBvw92yfPyGeCGto/aj9n3oFakkm4Yoiw9LRxagD6ZTCOVSNZ8W/d
         /9vg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="NV/BtH2w";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id g2-20020a056512118200b00492ce810d43si226737lfr.10.2022.08.28.11.22.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 11:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([92.210.49.225]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mho0A-1p5oPv2ebA-00dgf5; Sun, 28
 Aug 2022 20:22:31 +0200
Message-ID: <b8f4fb91-a747-0c86-1737-75cc44059879@web.de>
Date: Sun, 28 Aug 2022 20:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] configs: arm64: qemu: move virtual PCI controller
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@web.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
 <d6e6b2bc-706b-22d1-c36f-15caff0aff3a@web.de>
In-Reply-To: <d6e6b2bc-706b-22d1-c36f-15caff0aff3a@web.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ipJ1HH0Iyj4oGozuK0fGmEpPb95dXi80XZIaVgSUm5/Flnx2exP
 qs2QIL7K6NZVWmsEQuHLhtHIY3kWGLVIw+PVRM5uhDuivwvIqYZrIS3F/nYKfwtC+RMZ9Iv
 xKvZ659bFcLmT6sKdzcVAJzcEfFgGLH+TmQTFoOI3xfiG079biE5KreUdADN5ezlxsFjMQV
 G3MpAVFo3x7A9pJh5/KGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q6II4jw4UmI=:3CNJ1yo5BJ0iTrdZclv/cz
 EhUqF3Be2fBzs+0f+SV+e56mYmSVvb14sQZMy82qwmSwlSxjywSqO2h7lUrYK/QvPQNT9RqZ2
 NawsPDe94VwfgD7G9tqc0rmqA7DtxxxE0If4WVipui1CcHQM/ae/wnwYMd7HhVQHwMHDspYrc
 COumspUIsukzpj1LU4adapwJMAR1bZb2XoTDgN5Wvk+pkgU7q4cgfikbJSYhdUFiV10/0oWET
 TC0bhGCSQHqe2HaUhlF0XLz7H5G5Te3XhWkXtWaDB1z2EOWk62xRRwKaNgg6hw/eU4aP60aUV
 inhsWcAtjSnWXQ62+/uvQWEVmWx8MIFKpYzlyOH/8r8JX4PB9nxYJrTEeEyYrKs2K+69UIHFQ
 nh+pWUOS7kiJCnb++/vZ4dj/dhtUeHCGm7QUMSR7ZvQ8aQBWtYeTNx23B1PV6rnwQEiJyJWQE
 iuN3GYUwcJZMfqq7AVM1UIgVL+6zPDQy1ChxHACw11M9ufw7o3p/xzbD6NWC1pmw/xb4+o/6J
 h8N659l5YNEJd/KDCDSTtuWQ0gBgbhQT5l8rgYLMusnloM2GQ3OSPJR14hCsUmTGPQ16EqPop
 uCI0/9Uu2DNLA1HejvAlwR14XWcogQrDzzKQEh927uPM2fRqXtcse2RdFchH7crpkXuY3YYe+
 u28AAZ6A6/GG67pAOcBwN7D7f73129pz5n0NhUnKwYxrfmpwRsAQBlYKCZHLtjzxRpYGNG3in
 Uxv1xBSvlsF/yRwwVRNohFl9VW+DVBmm8HHhAggGNpbXSr3okEVAY7w7H065WuRbLD5EEA4Ak
 S2vRixbFOlhd1EdyBmbqSjF5emA2r4lwlBunw/JFtSzqBGiw750WdJnwmgwIK/RNRKuBtywzT
 kjQ7ArqhSsrVmpDsa+MjIrdaEeRCBgjs9DJ4Qx2kkNFgDIeuzwjSTVHf8AS0kORopsm8jnRam
 MQhgu29nj7poNG1bF/FdmZv5QggMsRsDomnkdbTQAFP9BGHE4QOTTdScNaypyI5QcX2lDdrIJ
 rUEx5VdOaFXpkk80RRKVyqczIdC0j9LFIh83LruySbFVjO3t4HQkW3tgGrgA3eIaAF9AzeqdW
 IrfbcssadZr7e+hRsJi5BFSCaqR3ZnzPGHAcgjvtZnSn9LVM61R2roQPg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="NV/BtH2w";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 28.08.22 20:11, Jan Kiszka wrote:
> On 23.06.22 23:20, Ralf Ramsauer wrote:
>> With recent QEMU versions, the GICR grew:
>>
>> $ cat /proc/iomem
>> 08000000-0800ffff : GICD
>> 080a0000-08ffffff : GICR
>> [...]
>>
>> Hence, we can't place the virtual PCI controller at 0x08e00000 any
>> longer. It will collide with the GICR. Move the pci controller to an
>> empty spot: 0x81000000 provides enough space for the controller.
>>
>> 0x80000000 can't be used, as it is reserved for the commregion.
>>
>> Note that pci_mmconfig_base must be within a 32-bit range at the
>> moment and can't be placed at a higher address.
>>
>
> This is just papering over the underlying issue: QEMU now emulates ITS,
> and that resource moves more things around. But Jailhouse does not
> support ITS yet, so we better disable it in QEMU (machine attribute
> "its=off"). But we will also need to tell the user which minimal QEMU
> version this implies.
>

In fact, you already contributed that. It's just missing in
jailhouse-images.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b8f4fb91-a747-0c86-1737-75cc44059879%40web.de.
