Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6O6UH6QKGQEYTFVPQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E32AADCF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 23:21:46 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id w1sf2452818ljm.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 14:21:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604874106; cv=pass;
        d=google.com; s=arc-20160816;
        b=C6rECYy3CMOd2+R8wJHBpbbEpLhwtHBYrUH6yVzQ+GxRz40+KnTJzP94csU6KCCq2Q
         LZzgnCvS01w057HAIo+XJ4Q0ulmGdbCEFgEdsssXbJhGi14TbbOCRLUm5kcckko74Aw+
         +lu++VY1CLUOYxSilt02Nd1MEU5hjcoFW09d8ifLzWWCoM25Wazpg5gywSTeZfhmfGaZ
         pk1cnvpfffYoNoHQpGy/knw1MBS//ja00dE7Erh+aouQMa5SVs2CleUqYcvi7Cv94gnn
         fnqPFDMd5rwhHKbwgOUdiWygPRWUOtULD7dankbot7sPeNyiO6gUta1twizun638JsNB
         1JWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=vCHR2HSE2Du/EYFH91ZLFczGg+2obDxlnSX0ATKvJWg=;
        b=n2OgOeqji+PvTJ91n56WKfoUSrrsZwyv7+RVAhyQHowt6D8JJ42IZrDDUEP2YUvEU4
         0/4jUFzXW9gBebi8FhWkinusQ+3mpmWUF73mFk9Lwiz/WgvvC7isWJCKNY36cWyvjtGz
         NqM2Dkl5fxztd/RfUa09lXI3gkSIFq8jfxDicjPzzvaMlXpuKC1OHDeKL6QgVSB34Zdt
         Twv9/8FCe/45MnA4gdj9RaFtGPL0w9s3nNfnScxx+zuKU1J7BJbiGAoBHXrDNivnMHRB
         GPuwC+IZdcY27MoxbXkiqEgraghtU6KlClJ+oyEbk5+/wRYbqMqj1PdTUBmILIhLmfyF
         h7lA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vCHR2HSE2Du/EYFH91ZLFczGg+2obDxlnSX0ATKvJWg=;
        b=QY/LnuMYhy/zwIu/eHXPMmfXBW9RfPetQuKaNXMz0qFrWBftPDd7v6ZbqjLHAEMH/1
         nq+bnjt4re7B223U/EQnjjpO1KM+ih+uO4ZSNGzdBP69KQW0gSzuUp4K0rCgsapVHeGB
         53IA32dlbGOvYtGMM28fr0TmcSoQGzRhagIOpel2W2Tc3j13pXLaH0XuBroiUw+vtnwQ
         Zqzf+pO8r+CpPnZg1DypX3YJaFtOjLCPVJ0FaculyDXpNjjl3AR/zIbR8UwXHaOm+2A8
         au+x2eIx0MsV+iKZRnbBTquTMeQcMoXvm8Gik6XH6+MFYIv5n7tLdctsct5ZzDm9FSax
         VthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vCHR2HSE2Du/EYFH91ZLFczGg+2obDxlnSX0ATKvJWg=;
        b=k8QU4ADJhHFgaWfOdmLxqtWDzWMtupG5QwQFZYlqiwfa86IouEq93/153MDUjaDPM0
         PQEovkD3azTxpitzX69UU7l2fUYmcRXdd3Ply/n/P5/1ViaMxOqFawkRyRrz/HWF7blh
         cJNiTH8l+1mb2Hr1kO9BOvcGKjNO6f38U16c4XjDWdrGo61yW2RRx1MyCmNvLtSpaEV9
         rXZUBMJDJXaC2Zocks3DU4581h4wxjfm9yDGQ6UiUzzwDiVhoDIt2CXeXWS8abNyly9w
         meHmVGMjMniVsblCkvaIFFiVuAzVeBIwvNEi2DBCDY1nlm1IO53Dovs0K/eXqTGpCVGr
         XyLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FtNnloppXkXEHSD5kBkwuk8JbkgXeqnyveJbDjIpaRcwFqD1C
	3u/4ugvoB9v+6NrtfgS3s8I=
X-Google-Smtp-Source: ABdhPJx/ashpflSFRNLcTVmTjcNxQNLtKM0+TeKidTXNwP6k5Cf2zz0kdBfRjahIDYl7kVX3ZV5odg==
X-Received: by 2002:ac2:4d93:: with SMTP id g19mr4254256lfe.594.1604874106276;
        Sun, 08 Nov 2020 14:21:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c15:: with SMTP id x21ls1015965ljc.8.gmail; Sun, 08 Nov
 2020 14:21:45 -0800 (PST)
X-Received: by 2002:a2e:8989:: with SMTP id c9mr1744014lji.26.1604874104954;
        Sun, 08 Nov 2020 14:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604874104; cv=none;
        d=google.com; s=arc-20160816;
        b=Zgb5iX90XGlJjCqjv4SVO67hRDXs6jYTQkEhX5oTHbkRMu9RHt6d1xIbvDr75TNGm4
         z/Q6rDS5j9jS8x7Uu9tYQ5PG8tXvcIMPW9TupEgN8uxNRPrN7aaZxeK7CVSMoJPvy2k2
         fdk7k9MucQU/7zKCdpQ0kBvBSfpphfReqII/HDGhSNcfv748M44slKzR4CMdb24xyp9E
         d1IfUhmyRuedt+L/+HixKRhWuLif9tlYXCOmogxlzkrAoR9qiPaGzkrTykcoBTkWHqTP
         knLqIBbODPUhlKi4F4p5hrWbj6QNw9tEQ8zQ6trv5S6ErSwPf3S2Jsm+b2+9dKh0vpkE
         /lUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=sp3r1Oiz7KJq4AspY3jqO8qzb6X04iaz6DKLVS9tihA=;
        b=MbiyRKaN5pQQMPHhtmjfrUevD9RMmvKdRcq0rsZ5U6ctyqYDGhhGGHpsQsDuPlWfqY
         z3z131QP35onjDSiH5tRQlIvpHvURgqSb+Ka4/8e3zGcze7hNSDPaE5WEoXKWSwKIPEl
         mUxHI3TSgcCPyS+kE0CM5RKXxbFFr3v0W0VRy/cP2CL2hTA8tPSywy/YTLoJukYTCnap
         pEy0ooUlXiNL1/FJOSqX4M78jh/LuTERMghrg5ruT9T14wEiK49DE04eAA188JUPdtRC
         amO+7q8lcCibRPRSKZCznJKEJawY+WO4uG3u5FtfPiubhx4Kr83n9qfFxH7J5vCc9iAL
         eO0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q16si57856ljp.8.2020.11.08.14.21.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 14:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A8MLiDm010857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 8 Nov 2020 23:21:44 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8MLhC7016227;
	Sun, 8 Nov 2020 23:21:43 +0100
Subject: Re: [PATCH] configs: arm64: add SMMUv2 configuration for ZCU102
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201030102540.131429-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0ad53e16-405b-c38e-c9a5-4abd0d3919c2@siemens.com>
Date: Sun, 8 Nov 2020 23:21:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030102540.131429-1-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 30.10.20 11:25, Andrea Bastoni wrote:
> Add SMMU support for: USB, SD, GEM. (See Table 16-3 + 16-11
> Ultrascale+ TRM.)
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  configs/arm64/zynqmp-zcu102.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
> index 151285f0..bdcb04b3 100644
> --- a/configs/arm64/zynqmp-zcu102.c
> +++ b/configs/arm64/zynqmp-zcu102.c
> @@ -23,6 +23,7 @@ struct {
>  	struct jailhouse_memory mem_regions[12];
>  	struct jailhouse_irqchip irqchips[1];
>  	struct jailhouse_pci_device pci_devices[2];
> +	__u32 stream_ids[8];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -44,6 +45,13 @@ struct {
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
>  			.pci_domain = -1,
> +			.iommu_units = {
> +				{
> +					.type = JAILHOUSE_IOMMU_ARM_MMU500,
> +					.base = 0xfd800000,
> +					.size = 0x20000,
> +				},
> +			},
>  			.arm = {
>  				.gic_version = 2,
>  				.gicd_base = 0xf9010000,
> @@ -60,6 +68,7 @@ struct {
>  			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>  			.num_irqchips = ARRAY_SIZE(config.irqchips),
>  			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
>  
>  			.vpci_irq_base = 136-32,
>  		},
> @@ -136,4 +145,8 @@ struct {
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
>  	},
> +
> +	.stream_ids = {
> +		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
> +	},
>  };
> 

Thanks, applied.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0ad53e16-405b-c38e-c9a5-4abd0d3919c2%40siemens.com.
