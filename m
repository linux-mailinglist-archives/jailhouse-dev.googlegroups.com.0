Return-Path: <jailhouse-dev+bncBCV335GORINBBEVNZT2QKGQE4AWL22Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1401C7ACD
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 21:57:06 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id j21sf1235562lfg.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 12:57:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588795026; cv=pass;
        d=google.com; s=arc-20160816;
        b=Am+D5phmeoOBCihaHR1GXtDHmvWavppKlHCcdkuPz7LgF8gmdE7WimHYdjXpSiStYr
         isJn36XOlBfIRtdvdWdzftikJwYehfdgkxqZn96QZLmJkou97Ega7pMhciK7ZApKr8N1
         Cj9kVAjTGaUdZWxfbw2Qj+JDQd5Urxcx8XZLoIkRI/GWO5/6Xx6NL2VbSXKtfoGMtkxS
         6bAsdCSTXV3lVWMSbgMlNJEz5Tk+GYnpg0zIKTfN91IY11o55d1s18+UUzDxJ/AHdXpB
         LKwyfXb4PVjRYWNVbi5UUIQ3CREGMaKIvroRMc0jD68WWmYbZHxNeGMQotylgbMLjnFF
         b2tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=Cg5gLxVn2AhUIdGAYrZqwFUKtBJghs9d/wK/0RJy9BM=;
        b=p8/uXFgWzQroE1XP/Fm0sicpxGkVlU23YUvvmomefNUlJEfaLxr/GrIRZsRrTIK8R0
         HHTQGELwZRfcKhtQaoqJL7SOgiGOnQHPZpAJC2NnMavPSDSoNKozM7L/UMPHUPjDCAd9
         GvSe/7JmhF03ZeQivpTTBv+4QsfuplG3uj/7i96fm+luLYjqlHH6QjitZHcoLesSRkCZ
         OuzGfxqorbR/Shd7gab+3LfhjaxKdTVJCZ3ovDH/+LmQCBhokihrQ76jsXz3lzTCd9+d
         aoOGxXhdbvZX51AxTe14tOCbMQ0SRMNKeggzab7m7RA9yR+hElXsE3142FwkbnQtS89p
         4G8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6hMnsov;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::243 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cg5gLxVn2AhUIdGAYrZqwFUKtBJghs9d/wK/0RJy9BM=;
        b=AnxXGcjz2uEz95XILZpU8kBe6i5MikhwSu+vdlGBfIvGFdXGMC1HRdBmp32Fy7jIxl
         RsCM/UrI14IKmYdnLd49Slx3Fur1uOLOCX7/qRMmVEdVTu/zZn+yuCn4+zDsb71R5EUe
         to9bd16M3UZVC4BLpripr/yWr4qyxy5PH4tlrWy6VFox7ENC2kmPtINAsP3eU3m/wcN0
         H5vtxO0+42qZx8bN7/Ejf5SOoexV8j99Q44JxXfWftlfs9ggVyoBPDGEPYw0hbWBOIei
         4cfkaUYNZGzoW5EsNIIojKL3kukUb+UaOTGFLhzeR5Kk9jwfUTSctYIWmB7UDvBz+CUL
         nsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Cg5gLxVn2AhUIdGAYrZqwFUKtBJghs9d/wK/0RJy9BM=;
        b=tFBMY9okMLZfLWQ/SrqB3o3lSpm3kf/3KPR1g/lfXt3UHmh1gbvMequSi1xwxxj3Wl
         MIwsMnRhXzwr3ZurEppoTJoAKXCwDQ9Jp62Vv7d7kFeKVeqWEvqZo28/62lQyImfVZC5
         KQFWuieRyYs2dDxvgsUnRGX7wKlxbpZA0Y9rmw2rp5KoC9RBxMJ6gogXJ6NuijEFTEKa
         Vf0uCj6xC06ofdmxdT67Gla7Sj2CZKHO8vdZs1Cps98kg362+xqMRshdfmvCj3M0JKiV
         cHtmO5o5n86p3qSEK7zfm9iSCwJG6XMnKORoAJ/qMTiAyFe6mdvq0Bbs+s0nE23jwZNS
         th9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuarOHDZS04F6svlJIFk65T4bXsqC4EAatjS8xOMVn0st1WQIscp
	Zl1m6TKBAEn6TvMb2wdG2k4=
X-Google-Smtp-Source: APiQypL4eg1hUaWVSF+OgVT01u+TuBozOZowtE/JL13TKyuSuxvX6S+/HD3HL46eNmvfPh6PKpL0tw==
X-Received: by 2002:ac2:5b5e:: with SMTP id i30mr1028615lfp.161.1588795026462;
        Wed, 06 May 2020 12:57:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a12:: with SMTP id h18ls915221lja.1.gmail; Wed, 06 May
 2020 12:57:05 -0700 (PDT)
X-Received: by 2002:a2e:920e:: with SMTP id k14mr6346560ljg.288.1588795025724;
        Wed, 06 May 2020 12:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588795025; cv=none;
        d=google.com; s=arc-20160816;
        b=jjfDoAr/1HJwTHRsze+rB/imuYIREI3IfjnB4XCozquJodkfC6LuRH+zB3ldIV1Yv+
         jI9bbLHoyndaCZmp8D5ROpm4Hx5Kugafb5NY6KdLR0gai7/2qmwhqZ6oGFwuNPNkjT17
         xqf5ZYVVhwU2SMJOZZ++459cbCN2dhuyr3mpfyGmelBzxBAcsd31QJARk+alv7+2xmHi
         tEm1nA+HLpKRuPFNz9Q4RZw28zi/Pm8iEOttFddDt/JWlrSgLMdNvEwDgb2/29I+N06b
         Qd753cTecQLsJwX+Iw8lv8pYFSr00HkjnYlRpgmWrwm+8qmMS/TPW1DMR/pGKqynVFJE
         BtFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Jnx3OUWh3bLAaj2GH+SClCCBB7RxwfEmZoiHTqw3+2E=;
        b=uOPCqbJwTOXnwOOB1o/3lNEQFRAiKFrJC41fmAv0AfuIEWmtmIsh2I/l/iEulfGvC5
         l/QtCUBRPkoEAuwPEjm3W9ebFDzOkrLbAN4IP5feqkRtZZIUefsl92LToLgd5ZsapWGF
         9V91t23C4kQ7RSCDo3F5YOpQVzB0ARu0RsY+Fg0nmPZ8kXfIcKNk7OJ0WIseNlPmefBL
         fY8/sux3D1inUdcuAjKbxGfBMOBlfOuq+diTjvbvlyEJYx+jEmG9GNZ9vlnIeoSPLEcI
         cvJFbUUMA94oWebeJxk+ImH5J6iKyvsgTnL4DWVApp6CFNntMIiZvdQOGj4FPH2Nn2hd
         LWtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6hMnsov;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::243 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com. [2a00:1450:4864:20::243])
        by gmr-mx.google.com with ESMTPS id c24si194581lff.2.2020.05.06.12.57.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 12:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::243 as permitted sender) client-ip=2a00:1450:4864:20::243;
Received: by mail-lj1-x243.google.com with SMTP id f18so3710674lja.13
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 12:57:05 -0700 (PDT)
X-Received: by 2002:a2e:140e:: with SMTP id u14mr5996309ljd.252.1588795024675;
 Wed, 06 May 2020 12:57:04 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 6 May 2020 21:56:52 +0200
Message-ID: <CAHFG_=Uvm2rLDvMH2w36M_gNwdTLwwUHLfrZeXA=7-wpkasg3Q@mail.gmail.com>
Subject: firmware search path
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=q6hMnsov;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::243 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
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

Hi

I have a running environment where I can create an inmate.
Then I boot a fairly small kernel and try to do the same except that
jailhouse tools are in a chroot:

# cat /sys/module/firmware_class/parameters/path
/lib/firmware/
# ls -l /lib/firmware/jailhouse.bin
-rw-r--r-- 1 root root 92168 Jan  1 00:06 /lib/firmware/jailhouse.bin
# tools/jailhouse enable configs/arm64/macchiatobin.cell
[10160.656599] jailhouse: Missing hypervisor image jailhouse.bin
JAILHOUSE_ENABLE: Invalid argument

(I am operating from a chroot environment and
/lib/firmware/jailhouse.bin is there on the non chroot and chroot)

Could this be because of the chroot ?
The main environment is a busy box that have no libc... hence the chroot

Cheers

FF

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHFG_%3DUvm2rLDvMH2w36M_gNwdTLwwUHLfrZeXA%3D7-wpkasg3Q%40mail.gmail.com.
