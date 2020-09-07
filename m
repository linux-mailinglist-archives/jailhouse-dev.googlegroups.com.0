Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBD763L5AKGQEWGQBTKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9926071E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 01:15:28 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id w2sf1820620lff.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 16:15:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599520527; cv=pass;
        d=google.com; s=arc-20160816;
        b=yYt2JWb586hrvEts1DptX8qFX7wJJVX+s0LmG3PNky5A0pBlidK9uF1jV1qMnrgQ23
         fzFEJp18efTwyuyNLSiVfXaTSmdOaxV4WZF4mIM4JiMDLIjLlPLBRFXXw1AYTNcocgN0
         f5BKkbNu19CQWWdknnbafMcDR5MHY8icqxvuppwJERLdN+fIk8rMe9ZLaE9v41w0RdEc
         fqq4WiUgsBl/yrOQAJ3b9uyRW04WPasgT0Va+5sFTIgZD3h29BTXCvvv4gsnLIN20pa5
         J7I20MmMhs+P5ABNBUEg7CbCRYHjo2V85R5xFWSBKRrIuKMeF1e+b6KYWFUmLWbEwn/W
         wSUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:subject:from
         :sender:dkim-signature;
        bh=D9bFKRXgR+nmEYs/2SLzh9BTaERnTSVG3h+L6gmlfjo=;
        b=tprbavNdk1eyAFdJwLpPVCoMLzzgAs4g4f3OGQQIGCHDaLWtLiONejGDClw9rxfnp1
         GlFl1nP3gQX3AhVc7ZZ1nJOAR1D6C6T0RcxWBvTFLxd9p2g5/m6+I0L+eXZbeNKwj1Nf
         +f5g49MBO9KfvdpCr54z0IFCmQNgPO3aLw7xobG9hxy40z3SnFqXX25BvwgC8I92FOdm
         +f3sSqVEH7q8PTnKgRfAFHgRU9rEDLYIF57AuM8jp7ZaFqf0NhH//dtubnXnm2omI0AF
         v27IbvfVelczSC3PmxRvQmv+zzGhK96RW/Aiz4tN/uTw901BdAGgiF5ZAYDoFTZ00RnG
         fl9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PmTIBqHd;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D9bFKRXgR+nmEYs/2SLzh9BTaERnTSVG3h+L6gmlfjo=;
        b=mZtPuO1J6XM+0+Kv1AmjUX5kT/f6srPGE2s6TV66AxBldAYKQ32afuomgyzTy4z20h
         KQ+kg+xufUaHSK7g+4dJu7gkI58Omg6NaVGFDVdDWkAxQryc9opbj9MhUXBPdENTkOwW
         qg6gfOs8dR+KvsnqyV/5f+z/hhb36M/kLq+vP1XCXx9f0kiAm4jLizWkSltptVbjdzo3
         YHGy6SXIkYu/I+OuMKaSGtW3nXqcFnk8JhmA2jpI8U0QmALZLEPHsVCjvTr0EHwvwSMj
         tDisIWD8Od/Y13AElOifrm9/wxVvksTbtCGALTCV/sX8NTwub/GvrqjIpXCSzxFbIIZ/
         olPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=D9bFKRXgR+nmEYs/2SLzh9BTaERnTSVG3h+L6gmlfjo=;
        b=VYcyCJuCfgXTt/vTaRcDj3wWZlAOGDnKdqQg2TbAV9LTEabxiyXT9x9Hjl7iypSC3o
         SH4UXydIaqGT+lDsucMVkSKZJC+JrhQgFGRd6gRq3y7IVYuxLpUP/ObapvZ25bU0ebQg
         OwpyuZZHu9hYoFCZ6g4NFIpGFqM5AwPvRSDtA9HGBV7f8scp6sJj2Sw9wF29Ovv7NcQi
         TIsCx+gUfG3S2Wqb6BN5X8ralFYT7BMCUzwNPkbKB/FsmliX5LVK7vJE6xl2o81zAQSY
         nCWGU1mLFqeU960WDTLAA2rxMFN2p6HOoZz97qRuTCyPyfhG02WKar8PRENDjQEWkCfQ
         1nmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xwqCyGvECXgVJKNE+H7sxLacqw15v0AZrIG9au8PUV0ZZoPYT
	pqMxfYeoNu+TxnCxNApObvw=
X-Google-Smtp-Source: ABdhPJyZTOyB3HFcKKRV5SXz0u5pxlvs9wsgqoVlhvpC07qaPp8iIN4SYrxw0JJT0gIXEWWaU4+kjQ==
X-Received: by 2002:a2e:958b:: with SMTP id w11mr12020840ljh.370.1599520527458;
        Mon, 07 Sep 2020 16:15:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls1644616lfn.2.gmail; Mon, 07 Sep
 2020 16:15:26 -0700 (PDT)
X-Received: by 2002:ac2:4318:: with SMTP id l24mr10981632lfh.46.1599520526264;
        Mon, 07 Sep 2020 16:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599520526; cv=none;
        d=google.com; s=arc-20160816;
        b=GXIbXpQm6iY6etI68LU5DZGVyw5lhx8iIrBTY2wF0VDgcEu4EqzUq5lHlS0vMc+Q7L
         kirfgNxokD7C2gs0AFeOAkBZM5U842mIe2itba9do/RNc32ajUrOjhglESTNzKaOlr+5
         ryXKJd1d4auwEL1l9WhVFwyH3kIETcGz/p6Vyd2CWKaG5gA/7aKGrNyNglnWs/d4Blf9
         hIA4gqwl1NemT6ihxHz9N6zLJhMFFx6P8o85bW77OF73WgtVkj+WUYKHYiveVxwH3V6i
         Nu1XDLatywit+LTpfJ5qjlX7c/Qe54rmAH7j3rQAgdTxd1QzzwMyDeQgpL8VfIBnQIHA
         IpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:subject:from
         :dkim-signature;
        bh=YnlwVMPk1zrFcAp/vTAsbWI9IZUdHj6FuZd31NMal/8=;
        b=sHXTSvE7g2zA8PUbks3EcEtFWTAmBFBx9Llk2gYyzX3grR2QeClhbElNT81ZgxVM55
         EMsL9EIcuf7qbZrmpnQspOuV4QutgmZ4VMnf/Dq6KLkzGfaaTUvUanpFNtPTLav8QeVu
         6h3kfIJpAeLUrrJ/pUO55A4vrjQsMMw7HYvGL8X2YaYQ6lCONHBZL1iba5HxEXBJvnuD
         eCPrYjoCh8wYsybL5vDXVlMnJs7vjt0OjU7yYpzPXY0ziMod1qyrazAMC+3nwvcJlWfn
         wx6eyfG1tHrld+ptAcfTxR4kLMKE2/DLsY+iNGkVLuLPhs+x0WmPUBp1U+1SbJK517T8
         1rLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PmTIBqHd;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id 11si417843lfl.4.2020.09.07.16.15.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 16:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Blkf50XVjzyCc;
	Tue,  8 Sep 2020 01:15:25 +0200 (CEST)
Received: from [IPv6:2003:e9:af0d:f200:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Sep 2020
 01:15:24 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: Re: [PATCH v3 0/7] Configuration parser streamlining
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
 <9afe26e3-a7fb-ebae-ea94-7d0ff228ebed@siemens.com>
Message-ID: <fe12ea0a-d279-1532-099b-e23f0ec822dc@st.oth-regensburg.de>
Date: Tue, 8 Sep 2020 01:15:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9afe26e3-a7fb-ebae-ea94-7d0ff228ebed@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PmTIBqHd;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Hi Jan,

On 27/08/2020 11:33, Jan Kiszka wrote:
> On 25.08.20 16:50, Andrej Utz wrote:
>> Theses patches mostly improve non-functional aspects of the Jailhouse
>> configuration parser. Logic for unpacking binary data is consolidated
>> into CStruct class, which all parser classes are inherited from.
>> To improve input flexibility, data slices are replaced with I/O streams
>> (see Pythons 'io' package for how to use them).
>> Finally, a CPU set check is added, which will list conflicting CPUs
>> between cells and also usage of non-existing ones in the root-cell.
>>
>> Changes v2->v3:
>>    - fix config_parser usage in jailhouse-cell-linux
>>    - fix output style in "CPU checks" commit
>>
>> Changes v1->v2:
>>    - reference class variables via class object or class name
>>    - drop implicit PEP8 formatting
>>    - dropped unused patches
>>
>> Andrej Utz (7):
>>    pyjailhouse: config_parser: store binary format specification in
>>      struct.Struct
>>    pyjailhouse: config_parser: move parsing into class methods
>>    pyjailhouse: config_parser: consolidate binary parsing into CStruct
>>      class
>>    pyjailhouse: config_parser: use I/O stream instead slice of bytes
>>    pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
>>    pyjailhouse: config_parser: consolidate header parsing
>>    tools: config-check: add CPU overlap and boundary check
>>
>>   pyjailhouse/config_parser.py | 296 ++++++++++++++++++++++-------------
>>   tools/jailhouse-cell-linux   |   2 +-
>>   tools/jailhouse-config-check |  33 +++-
>>   3 files changed, 215 insertions(+), 116 deletions(-)
>>
>> --
>> 2.28.0
>>
> 
> Still doesn't work - did you test jailhouse cell linux?

I did and it works... with Python 3.

> Traceback (most recent call last):
>    File "jailhouse/tools/jailhouse-cell-linux", line 723, in <module>
>      config = config_parser.parse(args.config, config_parser.CellConfig)
>    File "jailhouse/tools/../pyjailhouse/config_parser.py", line 287, in parse
>      return config_expect.parse(stream)
>    File "jailhouse/tools/../pyjailhouse/config_parser.py", line 220, in parse
>      cpu_set_num = int(self.cpu_set / cpu_fmt.size)
> TypeError: unsupported operand type(s) for /: 'set' and 'int'

When using Python 2, the slots of the child classes are not updated with 
cell config data. I'll search for a workaround.

By the way: how long will Jailhouse require Python 2 compatibility?

Thanks,
Andrej Utz

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fe12ea0a-d279-1532-099b-e23f0ec822dc%40st.oth-regensburg.de.
