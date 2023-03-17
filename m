Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBHPL2GQAMGQEAXUZPMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F086BEAC9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 15:13:51 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id ay12-20020a05600c1e0c00b003ed201dcf71sf2326218wmb.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 07:13:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679062430; cv=pass;
        d=google.com; s=arc-20160816;
        b=C5JIr28t+mMRXA/nQpweBLs+TbdhYzr+i3V5+LUpIhWwr+yW2H28BnqLUW1Co0EHfQ
         1uX4RGPtBuCAg9ZkgLXgCGydYpZz+Ob0DZOzcSaitIbqUtWSaOXQt3CkxDJujCiCeZh2
         aaUnq6loWFJmGyvR7zjC+tAfAPpqCJxpBXRYmetdJMbIT7S449kmAmcHvOxrBMfXA99n
         kf3UM3df281e53EBsv6IY249j45+yqrboPWiIPo1o2HyfnFc/dsOpfQxUDQz6QP2K0hE
         Pew60f2wGLD4CaWSz5QS0yr8gcg852tXzdGVTUOM/7P9uabYwwWtxHLboQCEp8FiCMft
         ApTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=rby5lDPtFoo/UQ5psCdz/w/N1VOhrLeHQ+dj5lQosB8=;
        b=Zo9AE6KDuhonvbsrTDZtHEkImW+P3EAXakx1bssgfDtZCSDi1DMXrOo531NjSou/hs
         GwDrh7tcOuHellJtWkUUx7h/EW+fIiDxHyBYvPAWnZpAa7VbOnSEq+XE2jKJ6N1r0zZt
         l8iaQg4igXVbzImwFoKIeWujvwqx9ZV6vU+1jM/WOnzPWL/MAbRZUA4c156j5CWcsSCe
         KBgemp8ZzG7c7Fy4+eDT6AgKAvxisfhLt6maZ3zbskHjmlZ1c3qBCDbiaTfljlQ/8Lpp
         OMGlnho4WzG2P7rabNulWrXb8NbD+Cbj9s6kHb5X6e6k21hnqIfJIU0vBa/DMjfEqFc8
         neSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=waWbz+dP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1679062430;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rby5lDPtFoo/UQ5psCdz/w/N1VOhrLeHQ+dj5lQosB8=;
        b=XwCVjVwcuXjj9x2G6JudJSdTTl6slquiN9Jbbs2wolNsQq3oZ531uzEwNc3W1KJceS
         i1kUhbDnk/fneTkMu3lcYBQAniyKbgt9gbT0ncl4mD+lkR+4afXPHEc9J3AxbfWkeUW4
         m1QgLHlVCkfTG5yixoZHhdAQsBunRhw95VOx1xpR4eUIsH4uIV0oMkgPn/l3WqPt1bAx
         He/M+GDsoQgCoXuWhmuQQtBIvT+9H9Ze21dQ3yOihwmtIYkymvZkc6VFsBCkPN7lJweo
         j7ajBHMbEXl4+wWONbIDk6WO3dBME1wEcNUZbw7xIH/Cf2zOS3kI9AWgbBSYR/qYfRU+
         DDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679062430;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rby5lDPtFoo/UQ5psCdz/w/N1VOhrLeHQ+dj5lQosB8=;
        b=0EWWXnVLZ4J0C2taZXSa2JjdeaHb1KRGWUv1rFy2Npx9ufZ8SF7LHdP+eivdD/NyOe
         bUY93g2GSfMYUVvks0NdMU0w06ryzPn0EgOeIiaaodOhyxLO8dOViFpqss8i6I7lqcHc
         3xoCjUmsAsnrCi3PZfUQbdKpchv2oMapKFsqpad0uKEQ71gfYOwyqxecBF9S4+Lspze2
         zt+3YYhKuuEqss06Go9tUBpthZsS4TrW6j25jlxkr/e1OMhbkjPCdgU2YSz6xAkeUysp
         X8f3MjdWDkxn7h/x5utgYJGboVo84AJ9iCOYYPZzQd6gbaDIyAubMbg0gR+dRFPLRqNp
         gtXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVE9EngOfjdEPASvHkYTai6+WeLy8r/eDTgL4y5nkWO2jdmfpoO
	4qwNOx5fOOTjE5Dzz5iSySs=
X-Google-Smtp-Source: AK7set+O4ye6mCuVIPb5r9sbl+Iod0xXkXyG5zAgaH0GAZ6bSJhlvqGIq6GSP+M8wD2u6yEh6JAQNw==
X-Received: by 2002:a05:6000:805:b0:2cf:e4ae:7158 with SMTP id bt5-20020a056000080500b002cfe4ae7158mr918210wrb.5.1679062430497;
        Fri, 17 Mar 2023 07:13:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da0:b0:3ed:2f3f:8597 with SMTP id
 p32-20020a05600c1da000b003ed2f3f8597ls2985396wms.3.-pod-control-gmail; Fri,
 17 Mar 2023 07:13:48 -0700 (PDT)
X-Received: by 2002:a05:600c:c8a:b0:3eb:2067:1141 with SMTP id fj10-20020a05600c0c8a00b003eb20671141mr24238815wmb.38.1679062428506;
        Fri, 17 Mar 2023 07:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679062428; cv=none;
        d=google.com; s=arc-20160816;
        b=T6CScOuiVMuT2DgFbd+u1oem4v/ZQzGihKtUyunCBFXhJAD5iBQg3jpGrPZomFWMgX
         8hPLMcpfTxQG7S6bg9BFHreTlDrBVNlPU0YHTILwvaBzP17t24nkY8z+fjiz4ZFl1hVF
         5j3/t1azkE69KPIl2xR2LdHo3SEADnpr2uHETqjI4X+zCOFWCgioJs9GQCLsPI/Ea+BR
         IECIqUEnwZrOIk/VfYb8I2UJkwkb5Phuo7dfGTD4iiqvCMj9ddutIfrkDBtsugY6KoKa
         StaqWsHd2A1DODIIQYuYyn+a3aTaLi2dI6esMhLfY09+29YFwDbrua2fJhmfHshgSt0K
         5Syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qcNaWNgNJCdrX4ErkqHUTlDkvyexkSekxGn/pJ2dw9I=;
        b=JqFn13iCrnR3T9YuaPtpPMXCeLJdq19m1iWGWhP46PPfDrBGwIgYWpqQDoqKEF6uEF
         qk1ztw9d8etcqhO5GmMx91E0z03hJq/biMnrgumOsGK3SMDhWwHdiTLrlKkBote4TfU1
         URfC6eXvhcZiDDO0z2FOI534G65npMPElnlzzJ92kAqRMR/uH7poVlitX7A94RjESbwP
         ajsvlTyE/W/OnHJnKbRYap7Fwe9O/iuxkGDgtiLg4bfsApmwXoU/ntqNO0WmXy792N2g
         KvTC4392dyjHGcTT3JOAU4pKIDmbFnoSIm+4yUqvBiXGAf4kHMMGtKIkrrHVhcwiXzUY
         y3NA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=waWbz+dP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id az35-20020a05600c602300b003ed2382d2fesi423350wmb.1.2023.03.17.07.13.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4PdR241VCfzxt6;
	Fri, 17 Mar 2023 15:13:48 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 17 Mar
 2023 15:13:47 +0100
Message-ID: <e442d6f8-e9f3-467e-8a9e-5ef053b6e46d@oth-regensburg.de>
Date: Fri, 17 Mar 2023 15:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Question: integrating Jailhouse in the Linux kernel tree
To: Daniel Baluta <daniel.baluta@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
 <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com>
 <a22210d5-6ea5-4926-acc4-fec65ca36884n@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <a22210d5-6ea5-4926-acc4-fec65ca36884n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=waWbz+dP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 17/03/2023 14:49, Daniel Baluta wrote:
> 
>     What you can already do is pushing the setup into an initramfs.
> 
> 
> This won't really help in our case. Our driver (Sound Open Firmware) 
> runs at boot and somehow
> it already expects that the jailhouse to be enabled in a controlled way.

Why? What happens?

   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e442d6f8-e9f3-467e-8a9e-5ef053b6e46d%40oth-regensburg.de.
