Return-Path: <jailhouse-dev+bncBCVND6X2RINBB6MXWPUAKGQEFRTARCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A334E7EC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 14:22:18 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id s4sf2589308wrn.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 05:22:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561119738; cv=pass;
        d=google.com; s=arc-20160816;
        b=lgmUN378RXZ4IHWOGYlCOVVQtMHanl/6V0GkxUvPOsZVTdkOOxW50uafmbpdZu9ekn
         AFe4f9YbVJ0tfDGwjoYqegzOHgOPkg8+OwQtXFkD5U1GmHvMWpBGqG0JUoF8/XzwZ/e1
         1Se5SLTli83E1TS1NWxDq0MfFt0j5bNlg42jZAr6kG7EN5b983jEyNaUKfynMglLlhuc
         ex1iMchR0rXDsexXnO7sJ44vdwWjRhXX5NpCyHxkipkRA4guRJNOSZ4Ov9pT+93tBtP9
         TpasQ7mhXSELYAVc78OWyFsgpnrZ5B3S2iIC/JWkdkKYDol4+8JNerP2hQKkpPxDYug9
         Vqdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature:dkim-signature;
        bh=bLx4QoLyv/cc9+4hlMs4jPq9aQRg0j8bw/g19j3NjrM=;
        b=T/g8nyYFNpcOFNwGqZFEjIO+1UGTMruVQMCeyY+Q1AkSLF+JDQW18Qb3adyIDlLasC
         xv9hBq889ws025uSYQ0LY2Y7/kF6mMPxyiRIbl1SVDWnNaHgpvGeew1PPnwIELUd7kXa
         kksRvTvU+47VQmhpmRNvwqMj/cCXKAQoBZT+KYlaEk+bPsrfWXw+S7HQX1Arw7C22VlX
         zkKtD4wDzg0CyLTINlF6dQJmjO+XkKwmXGs/vuQRhvaddMlKnlMXYnUgLGNn8zV4TjDZ
         30cLvvWIyngYoqxNqOyUdvypuJL6HGRPNLvUDtZbiICK0M6crqzAgnbDNcTJUGveIRKs
         7AYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WGXMwsUq;
       spf=pass (google.com: domain of valentine.sinitsyn@gmail.com designates 2a00:1450:4864:20::129 as permitted sender) smtp.mailfrom=valentine.sinitsyn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bLx4QoLyv/cc9+4hlMs4jPq9aQRg0j8bw/g19j3NjrM=;
        b=BeaOijMPfJWllZp86H/2tjjDxvTODRczh69IBVDxSdhdILCDY347bgzHtfEGfgXfAA
         h8vPtlAJ1+VpqmoWVosDwjf6RUUoBPOuwdiG7kV/HQQj09hQ7ieqJpNhsjDcUG+IsOoI
         U+JWCBQlnb3rxT8vAHov+77U/k8yRT1+tpHluUSCqvMhcHqRE6+mwv08gNMMyDYBXUHi
         vnsMtqjvMvukqN949XCUhiCtGMWrx5IxBrcedGTUsFQ5hQsJXcssop5gaaagRXk78FqB
         E5E76LQgnfmmr8hS6GY4BmMeixkAmvRgbPHLqjmWNT0dAGqav7cT14o3R0FvC07Lsmko
         fCig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bLx4QoLyv/cc9+4hlMs4jPq9aQRg0j8bw/g19j3NjrM=;
        b=Q2m/ahcWZwAS3cBsrT47FdCHqZKULz+7p+Fe1lO2CWaY9APw73kJkJwSKYflCOa2j3
         LviiH9sm4nfZv0nDnZsQa5m59X45Wr+z/vqYPJp2V+MFsLcNOuarR8GUQfi8oGqPjjEi
         UD58d73vNiuByuBdj+ewHQZIJNBmWZQXiXwJcNgtg5stdQr5OZrbuZAjlagE7bPxfU4s
         TcGdHIvQQxX0nnZ7GCKx5HXn7VQMQBurt4MSTgF8Ab69F/+/lCa3WwZ+i4H81sPE30cW
         I3EAzAgn5IRy6qX3HirbC2EEmpC7rEtuhA/bYBIFvK+0SbG/8MqwswdcZnmldNDkrPMR
         J1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bLx4QoLyv/cc9+4hlMs4jPq9aQRg0j8bw/g19j3NjrM=;
        b=GAhT3C/Jla57/hV2dF6zzxwjl+LsVU1Rkx7XsUufPL8IH1qfhhE/JlZgC09Yu9nhBr
         Rcx2aUPvUbUgkCJi76rI0uOGspj79vhd8Oy9zwyJstAa5LOaM6Dif6GV3GVlp0nXzwsT
         sC6p9V1aiQ0yK9ncnRBLA+IeKc8qPo/QRKXvmw/br4ga2pvzU/JwAEuDJaLNn0791Y+u
         /VQE2h+onaZAYb69oxhrWy9NqFKBOQjH+NG3V431DFxeavepXqa0ImshVF4xIPja2WAF
         w3q7cCaINyK82tSbhTpU9jXmiHo1wet/78OVcs5oL2upLgewIaCfcjgPKvNP8pTwy8Qk
         RZgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWhbK+OqTRCAQ+avAlvF1S8J+Cj8272VoCr43+lB2RrxcdH8IKE
	kHTV6kPRm97v+ZdGvWz7Apc=
X-Google-Smtp-Source: APXvYqzarU79h/NQPnJpXekny69Q29QsLXyDbCJ6KCh+mLFaGHNGoUZ4W0DPGTTkMk5DC6Lyv5/eMQ==
X-Received: by 2002:a05:600c:2311:: with SMTP id 17mr3912348wmo.18.1561119737953;
        Fri, 21 Jun 2019 05:22:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:94e2:: with SMTP id 89ls2119217wrr.15.gmail; Fri, 21 Jun
 2019 05:22:17 -0700 (PDT)
X-Received: by 2002:a5d:5702:: with SMTP id a2mr54736172wrv.89.1561119737410;
        Fri, 21 Jun 2019 05:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561119737; cv=none;
        d=google.com; s=arc-20160816;
        b=YvKrgoZyfUBKKoWEKaTRI5AX6vpi4v/NH2nbs9Y2zugdvCCIi+J0Ww3xetHJc0PV76
         d1M7ZeeJ8OFTPwcnhviNvPAiESHQTcWi48El712WrpxTHUVs+vkuYlHBgEsOk2cTa4wX
         4FbrzTEPj4kXcNVu54gHfRPreJBhEq4RhpPKn3NfYIYpEzNBeS4vf45m+51CZMQlN2dQ
         BIEMxxtnWu6p2ILL+88IhS3JNaLeU++zzlZWEb/6CaWci+EacB56bJTAR2y0eA7ovvud
         5OmPsThqjrjADgVZL897eje7RRbaLLMyYIFhIga7ykIWtRMK+gl+8ld2g84YnBTSppHn
         yXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=tkj4lcI0BEneWrSkZNKVUl10MX5Esa30WgxDboiFmcg=;
        b=lwLv3CmPOAPO6TsY8KODJMyeXUj5n3nTHXJtekPlVlZ1PZzyzKzMH9WnVPwkIVsdf0
         aRIv8Loy8mAEFnwsJ1VYdQkQXl8kYK+SoK3Ns8z0vdZ9OfNbPXqf4MfiDz/wG4XvFg42
         l49PJMfI7EW/NxrurP3cWTyojxdhpsniTk31hjh75D+F3BkEAEej41KzmGF+eGLXADS7
         OyofDMOQPlsG44JdIzU7NN9eJQgw76zl8eam9xVbsAUBaA5fGNA0OwB+2d9IcvBA1UgF
         t4/LkFPQTVOJXnqUV8Lt0n5MKjkc7PC8KOE6UASR/9g4aIcy84ZR0QO0W2UCZVN+ezQR
         fONg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WGXMwsUq;
       spf=pass (google.com: domain of valentine.sinitsyn@gmail.com designates 2a00:1450:4864:20::129 as permitted sender) smtp.mailfrom=valentine.sinitsyn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com. [2a00:1450:4864:20::129])
        by gmr-mx.google.com with ESMTPS id d5si165631wrb.0.2019.06.21.05.22.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 05:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of valentine.sinitsyn@gmail.com designates 2a00:1450:4864:20::129 as permitted sender) client-ip=2a00:1450:4864:20::129;
Received: by mail-lf1-x129.google.com with SMTP id u10so4903969lfm.12
        for <jailhouse-dev@googlegroups.com>; Fri, 21 Jun 2019 05:22:17 -0700 (PDT)
X-Received: by 2002:a19:f808:: with SMTP id a8mr4597508lff.29.1561119736541;
        Fri, 21 Jun 2019 05:22:16 -0700 (PDT)
Received: from ?IPv6:2a02:6b8:0:2807:e567:3337:82a2:b85c? ([2a02:6b8:0:2807:e567:3337:82a2:b85c])
        by smtp.gmail.com with ESMTPSA id s24sm234962lje.58.2019.06.21.05.22.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 05:22:15 -0700 (PDT)
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
To: jailhouse-dev@googlegroups.com
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
From: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
Message-ID: <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
Date: Fri, 21 Jun 2019 17:22:14 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: Valentine.Sinitsyn@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=WGXMwsUq;       spf=pass
 (google.com: domain of valentine.sinitsyn@gmail.com designates
 2a00:1450:4864:20::129 as permitted sender) smtp.mailfrom=valentine.sinitsyn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Adam,

On 21.06.2019 17:16, Adam Przybylski wrote:
> Dear Jailhouse Community,
> 
> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core Processor. Unfortunately the system hangs after I execute "jailhouse enable sysconfig.cell".
> 
> Do you have any hint how to debug and instrument this issue?
> 
> Any kind of help is appreciated.
> 
> Attached you can find the jailhouse logs, processor info, and sysconfig.c.
> 
> Looking forward to hear from you.
I'd say the following line is the culprit:

> FATAL: Invalid PIO read, port: 814 size: 1

As a quick fix, you may grant your root cell access to all I/O ports and 
see if it helps.

Best,
Valentine

> 
> Kind regards,
> Adam Przybylski
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca059740-300b-f5df-3dda-65ef289599f6%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
