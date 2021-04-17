Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIO55KBQMGQEMWVUWLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A7362EF9
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:47:14 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id a18-20020a2eb5520000b02900beebb1aa69sf1648859ljn.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:47:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618652834; cv=pass;
        d=google.com; s=arc-20160816;
        b=fHXTWrZIh1IwezXkLu5F4FL0ZM5RJuehl9VtVBpURKGv++2tO9ZA3/fRVebCNt2fLi
         Dvb1wU9dfhhizenL7V3Vtny8iXb0XWVyJ4VmGqLlj95pNIUV0hsjB809mYTZ0AMkgVW2
         E6I39gt+AGO9nkCNr5zCHyrE3Qyyqgr3kybgWPoHgc+ur7wbB9csLV8Fs3sjnfJUZh6i
         0IymQqYwsWPXILhugaqGoBfEltTMcVxNSM0KTXYpxVMmIx+7imviXYCUjm/sa2aIvqf8
         v4qF/b5oBipGpgcDnaMyr1szhrcfzaCiAlfWf4uUDsapVnbAIk6OvLmL7n2Da9LyqqY3
         WnNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3A7pJJoyY29TYXStPsyWHb4tpIhafnaqSP9Uf+bZFhg=;
        b=hqQXdLwEXy1ck/FY51+4PoNqlMkmAk2a/6Yi09eAYh5Pd0GDK6C6rWHnIqdjEfRffC
         7BG4gHLWDnsrGThAQKNkOm4/TDmg2RVts8UmlTjmBoc++HzRxuLW6Q+a0nkxNHhtt8mo
         XSDuiiXFwwNYXdx7BeTEwvDxliDJO0NAoFAd2T6I+jyb+Xikx+PEXX+ldP1Kq/NXi5Ne
         +mNzYxcamvI8kjghVovTHBNv88PB4tM+r6l3+fJF8izqeefVBh98xMFU36CgHH+Zd4es
         oVT1CCGp0qdDUO83BUreP5hzGfpztoCzu4TT4Pe3KZv2q/FPWpfGA4l88Orbv7/MIzGj
         WSjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YANbjfvx;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3A7pJJoyY29TYXStPsyWHb4tpIhafnaqSP9Uf+bZFhg=;
        b=sr3DMWrWfQcv0fwik09QRfd5H6N2gF1UYZLP64y5zh03mLi8/1HLRkKhg1L5nX8uUH
         CAjnvN5gVswR7UHWmtqCT2guDWunn9jJWdDUt/p38Gov8mzu/CN5Z9GuJpNhFMwDIbM0
         u2nMdkuaQU4mp4g+wTmnEp6CpySR9n1Hv7CfR5aNJYAorfGwLzCyFpFsQWlZFk4Mt7vj
         zXaSHQ6ETExGL8XOzVVC5EW/nBK+S/JZAGyt3bd4jKxqR52EMPfFg24xf7+ZIYtTULcf
         uNefew77y29eqqwQjtJQtdIY8RK3jj/vU7EJIS7LVSNsVZDHHzWR0RhLYbfu17BsmO5D
         m5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3A7pJJoyY29TYXStPsyWHb4tpIhafnaqSP9Uf+bZFhg=;
        b=GUJyEQmU5oLSzLmEwLCh66/cjI0UuRhX9WPcbbbrg2sUkiuVJU4EhUcf2QSWdIP+hM
         BLy3GLmR20n96xHBOIuAdhdQpW3mXrv3d7QdNtaLrPsMih1zcKJnPmTFM9/iTEYd57Uv
         UzZ/a4POMhR1aRiwtvobQOYghqi+WRrNHz7SQHl/JLpXNUN3Jftmh/MuXPxKkqXreb+i
         h1HXJ+5D2KNLYxE4mCYtiUn6W44maBKN2SGPTXHqMCcXWxDzb5Mh4tkE8do3sdFKFZCY
         jZj4GuG8x9adVflXTPs6rY/4M25fwyhwugvBMk8BXktZpavbyDMcixBruZNLML+e8V92
         7m/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NUjtaTq3fRMUhoDzqu34vvDLsGPMEjIchqg3naB/0fBXOpEk7
	cS2KgNjeGLO5anTsZyaSVXQ=
X-Google-Smtp-Source: ABdhPJzBsGKcNp4vC/mtSuDbbGMpDn4ZfDX7wo70Asg9eR8MCOnsXky6cDFFU0Tu0oN7p4psATXlrg==
X-Received: by 2002:a05:6512:94d:: with SMTP id u13mr5554563lft.368.1618652833979;
        Sat, 17 Apr 2021 02:47:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc23:: with SMTP id b35ls2415235ljf.7.gmail; Sat, 17 Apr
 2021 02:47:13 -0700 (PDT)
X-Received: by 2002:a2e:bc0a:: with SMTP id b10mr5157360ljf.231.1618652833000;
        Sat, 17 Apr 2021 02:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618652832; cv=none;
        d=google.com; s=arc-20160816;
        b=FZLcnr4QVl/MYAAN7/uIRRkaUEb3wSsusBgQRIlyi9t9dN5FVFweCxPTBWHm5kWonC
         3QWzj5Rb5bqh50DdVyFE+WcPtsBJA7W63ASKzg5U/uSWMWXk2MYbElpulosmYMAubswq
         6JzGv9hnBZTLI4KMwgSuQEd7g83HchYbQND2zMPwRKk8tFq8BXl6PZV5nTkNs8F/dFB8
         Y2Eti+EAfuSA4BHPFCLoGn+4G77QAB+gfq2vDVUt+9nNp00Yon76A2WwKe9pUEsYIBFM
         D6bgaww/we1ckH94YR7zPFssiLHwjJJ+496JaHAQaEfqRM3/C8g56FO8W6h93nulBTWj
         a8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=SAqCa/VlKJiO2bxZcYvEPtjY9V9PDA4uRcGgWWM0utI=;
        b=R0emlubP+ys1TS639TFyrsAmmcJWGlTmaOamgnPz8rFv9XrFi98S3GiqkCdXtzpG/k
         LumEUFZPYIOIO5t322EHwQNrseHaSU6fSsyhbftT/fkpDSsYt8D2O1OmY+aELrwDm7kF
         W5VrHau88yKa39TFPvRskS45yhHzkQT/j8OlQtURPp73fFimiCj78C4HyHNV1ChMBDML
         6iLrQJlIYBdI965kU+nWPBn31kz3cfwr+IQIR3OgQFzCnSSH7ZLDV4c4aInigjcALAYb
         0xCpcRRX4L2ifT1P/F5fvmkH2DWVF8gqS9MjjHk+zzpdMZMK3cn060Cni7KATB6L6VN/
         7EnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YANbjfvx;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id b17si230876lfo.9.2021.04.17.02.47.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 02:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MTPel-1l89oe3CgZ-00SK3W; Sat, 17
 Apr 2021 11:47:11 +0200
Subject: Re: Tested x86-64 SBC or mini PC
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <2bd89d4f-6959-4701-b661-3d3e98a2e260n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <56d20fde-1da5-8f99-7ea6-81cb0b657690@web.de>
Date: Sat, 17 Apr 2021 11:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2bd89d4f-6959-4701-b661-3d3e98a2e260n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:CeiGnDRBpV14eTvxyLpgu7oTTvbUGoTf5AbMiOlEQewYgdm0Zg+
 cI82PnUOpbFQB4LOFPs3p4DutZgP5cCl440AwSORJRx06x1rihHp353xVcmwGr4qErmqS3/
 lC+g5b9r+jCYx43/kXLmwVsFxPm7D4FCeS3aIbvGn1nQXYkfj/6dn3pqXRB5vIgNtvp6hTY
 3Q+qL9UNR0TG36YppA2hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:if/qCpT3m2s=:EXpviimveKe5FANyJHLW+1
 BbhA37op9qjO5ARPR1mmTpCb0SkU+2/PgEcOKmzbSjuTLNEQnncLm1ch6cShBdvOc3pHynUGY
 ZUpxe4VEHz0Pgrv/pH/wGOsSDefO+D0DGiPpMAA5pYaF4ygN0uIC7xIhEJorUO9VnfBsTho2x
 LqMQP5pDdCv1ad1aAdZpwLPbtqyrMr+yZPaVpA0DY7SSuXYMUBzV+ybtNqSRUCOn4czIVCmSi
 ldZNdF35j2gCRa68RJxbHoeEHNZRnJf9p63dGJc1dN1881AIklR+kwK/M9W0rClkXdlTQ/in0
 /9C16Hhj3ZTCkewg5PvIrQUFNr9OacBsz2RanTzweoL5KXtL4JUSBVj5kHWCN0Jzix2GoACwZ
 I9Br7TonlmF4g7lojGmwlAHhDAdjacOVc/RRXOPLSVxRi4Dp0UDL5TeMpW2PSJBFhUcnoHPFn
 9Ip+RDo9+C9v6EY3kl5NKelkeX4ffjQCeO6+U7dgBgesr2WfmF3BWMrr09DVfue0JgUKVlolT
 iNTB/evRl/qWTGOPsI6aIs4/W8Zn6kOCYy39b8wz0a0yoYE8SDhoknDFdTOrp61odSrPK4wy9
 dcj7U+woh0UowhB5t05eIZnE4bJzU3rXeP1xeaZ1Sl62z2KIeIp30usvv4M5dd6zcpRpLljCw
 b2CenKuga0GtmKKEk0L8/9N7s/OGhD7KrGUKJnibXUTQGFZjq0w1UH+43K3KzMPMtJJC782Ka
 NPShy6jUKTmjhdL2nFLVNAaEjTchbHL4QhWbCc2hiZXD52cdLBDrz8C9+p8YZoOe2E/EuL+4l
 eJDxy97ZtxmQGwNnI45vp5gG1t6RaOhX4/tZibXlFpYks+YpDXQE4CFPCj+llACaLx76WuW3p
 ZcjT1+QZL5WDwPRTe3A9AxDGrxVIGE/muUdebqIRw/IdnNyfHbnOuDrRXsGGb1nYwZWcbyZX5
 IO3XcHKqxzLQfRxQ11C8HejHlAZMU2JrteIMKwCdhUokUwJSuWsoLiISdbm38gUStKN807Ub9
 IpuA7C8+hThyb+bu46T9FKWcdm16TS+i1UDUs9aiA4irSe76bb8kZZZZQq0PEz82Vz1Gy4pIt
 HQUW9sicpOh57WZ48YTX+clrckvHF8PUs5uk8YUv0glNzzHnlVDa9oQ8iiKr/AkwV8yRERkG4
 mI4XBDTHMRqppOmWt/9phmguE5d8wTFrLX15GUzYq70eEmGHE5Rf4kGlYm0xtrUWoSKzk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YANbjfvx;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 17.04.21 10:07, Chung-Fan Yang wrote:
> Hello,
>
> I have been developing on top of Jailhuose for quite some time.
> Just become curious and have a question.
>
> Are there any officially tested x86-64 based SBC or mini PC?
> Will a Intel NUC work?
>
> I do have a working Xeon Broadwell build at hand it it costly to make a
> duplicate machine.
> I did try to run on other commercial or self-built x86-64 PCs, but the
> on-board hardware varies quite a lot and I did have a hard time getting
> things to work from time to time.
>
> I would like to find a more cheap and stable platform for x86-64.
>
> Thank in advance for any comments or answers on this.
>

I'm not up-to-date with low-cost x86 boards. We have pre-integrated the
older NUC6CAY in jailhouse-images, and similar Apollo Lake designs
should be fine as well (though surely not as fast and low-jitter as Xeon
targets).

Maybe other users can share more recent experiences.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/56d20fde-1da5-8f99-7ea6-81cb0b657690%40web.de.
