Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZH2QWWQMGQESFPX4ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id E49DC82C515
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 18:56:54 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id 4fb4d7f45d1cf-556c3940051sf3491102a12.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 09:56:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705082214; cv=pass;
        d=google.com; s=arc-20160816;
        b=WNclRN6Vr4op1JBXtcCUXMFNfP0St7OGF3tjvgL5XTPQoXz8y/BhFBlk9clz6aObdi
         qNpCfD8nRLrHc0TvWgj8MUSxCoJEfsHOebi3pUE6pvV4+YqnXH8ZIv3HGpeeZcDGLILE
         zmsWlBP3rNA70gSIiJIH9tOi3gaKwKYcAd88U98EmjFQWPQt76w0j2TqSLOjqmYZbSgA
         nGwy7WswQ2yG/rV9tq+Gu8Xm+p0AHFUfZmtsiXECtGobl3sD4oTx98pGyJ5AydnCzvmm
         ch1Ng1lXt7mj776PXRcbw/LQ5vPUJiXgMi1pKEpTEWexC0uYmRyrTBFCLrRuzD1b2USI
         9T/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=n/GSnALTjgmb76yM06Zs2DDqzq/jtEbwugpsiLwiwqY=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=knUEDSiZCjPOSiIqCMPL1jfTLuL1ZNZAfTTT306nGQ27G2UPCYGb4UIL6gI4+12mwd
         g3leTSduY3GG3ZHxHqWNMR0qMylyWgN0iJ235Y0Ew6uquVOvTzpfIXkqXSdjp7uYWcIC
         u+1eqoTJafw82G8tYzuk2ZcNtGNAS5BQRAZZC8XDGS0wNUn70Sy6GoPkCe9eByQJz6dB
         5j6WvnXdLB8pfMtwM533yIyqplLYtMpnrqS7XP9DbTKxH2/Lt0JJEHrXmzzHbAS+EuON
         W9gO9bthgLeZUiw69HIfzxllKTD2lXoaiPEHwg+xeFlBkJvxa3WuXeB4bMg4GJgJeyXI
         icow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=P52zHmuD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705082214; x=1705687014; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=n/GSnALTjgmb76yM06Zs2DDqzq/jtEbwugpsiLwiwqY=;
        b=dZhwhVhEM6Jzdmm7R1moIitZpjwhJqPspeBqyt9ZNB/nYcjRxTS+4gW+/MyVacDbea
         bjwzNxamxSj3aueqLCwVaHbbTAyBcbR2d9vRMPKoyVkscgK/FHEqBNdE0axRaE1VqcTU
         EUFoiLleMT1DVIVGDazMlcRB3w4zBLoDjHET9sHTorb4uaVMVUvJptCHe5pe7qie0dhH
         GSMgf3qVW/4SeN2YENCIgE4XOGu4gMvai/6361xpIxo0aWOowtvTuIHYbCYw4ugtnWwX
         dLzQsOoLvu447Vi3QAkV1V1cHjCvG01Yr1cCMJMpF5+HAoIeUyORhvZPNrRG/8NsUrq2
         B+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705082214; x=1705687014;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/GSnALTjgmb76yM06Zs2DDqzq/jtEbwugpsiLwiwqY=;
        b=u9TNejAzc0i5K7gcJkw76XXZDeaYmOK7I/gQX8C6OX2Z4hDTeDrfPOMYPbD/64dsU2
         Q3PoOs23yiGuHmqJaLy9Cb/FdiHS3ZvRHx+2xAtY2AYvuGdGvYcNV+05zLReqIlc1iZl
         xjx/gZgdh7T2d8TQUq6ZG1M8KFEIi+TqoIA2zX7opy/B0tW0faVms3aKIC/O/TCBJUFt
         a5YnaK5vHfjvOJ9nDr2+ZXFLJgbz154kz+0OkYggABiG7IBakkkRAYbti4xlp6f7zKUw
         eCOvApNU6M80XFGk1ojZwBJRbsHl2dZub5SyjUujqd9pxiyi87LlEGxK1d+9RqZC777X
         xjMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyZe3fJjSHlc3LtpOY5Uu+70uzwW8NV0IU2CJhpY119W864AK2H
	N8KRLo5jTVcA8EmUKeeGT/8=
X-Google-Smtp-Source: AGHT+IFHHAA0P9kJW6gW9m+BcfOu7tHyD5hBht8FpADYqVw5bX6300+u46vZWzr3rp6lqhbjXdxbtg==
X-Received: by 2002:a05:6402:148b:b0:558:d5cb:aad1 with SMTP id e11-20020a056402148b00b00558d5cbaad1mr454073edv.104.1705082213304;
        Fri, 12 Jan 2024 09:56:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:400e:b0:555:6e96:389e with SMTP id
 d14-20020a056402400e00b005556e96389els310322eda.0.-pod-prod-02-eu; Fri, 12
 Jan 2024 09:56:51 -0800 (PST)
X-Received: by 2002:a05:600c:1994:b0:40e:4794:f225 with SMTP id t20-20020a05600c199400b0040e4794f225mr601710wmq.9.1705082210672;
        Fri, 12 Jan 2024 09:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705082210; cv=none;
        d=google.com; s=arc-20160816;
        b=PEKez7961Umz9C4UjEDY1Y4osxv3pZgoACnFL6EfZcyuYOV2oDA06d/9Z9tywijeLs
         O6HQNv/OHzQ4+jF+yetGXUeUu2hhicjwhJxOFLrk8CENNMUt0wwaGfHQIQcBOg3Ggoy4
         ATlDzCEPwYekW1OuXIxvaqlxen3esMFAQBQHu7t22nkWBv+8eWmUBhL/6yPJNgE3R+RJ
         adX7JIeIsAo/EQHYr0pxYMyVKon14UyQDkEeiISA9leWAPS5ITcmagb8iR2LKLKauYEj
         D+Umw+MRydAcY7IQpOoOnFgeysPVuArQOCR58o2rbmvBNXOduJ8j1WiXjM0EBHjWM7m2
         27Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0zlqPhyHv0THfEn5RIFhS1iMlY42zZYtVJSYC5+48dc=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=TrucLZDRBR9/KCljCQdjGLJXMA7V2094IULirbA51+sl4YK2o7iTHbWCQ9B2aa7rbL
         wZk/JEpvmYAsWhrFgW484qQVzcm4nxh8d/oj5eWhpNSNJkbteKfta8nwRVRH1glPrfP9
         P/qycQGIMClS8TrQrVrsFADSt4YyqwnAasByEO9dZ1MONEx7bGOruAHmaeHt/ANil8Vv
         zcw0idzVbjcX1JuIOkN+LV1UENt8DwisHdH2GUnZTd1gLUsK8QZ/ZItSDnSvkSjz8J9x
         eTvMXhLEAFhEPGHhthUOGBRp+MefCMqCEqtEogDLxBTmIkKTIaGTaM4Tybc0KAlrDXpd
         hhGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=P52zHmuD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id ay15-20020a05600c1e0f00b0040e6710c113si60972wmb.1.2024.01.12.09.56.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 09:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 14EBA2E0309;
	Fri, 12 Jan 2024 18:56:50 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4TBTkT5Tddzxqw;
	Fri, 12 Jan 2024 18:56:49 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 12 Jan
 2024 18:56:49 +0100
Message-ID: <f0dcd19a-231d-4c8d-9872-e962193eda03@oth-regensburg.de>
Date: Fri, 12 Jan 2024 18:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=P52zHmuD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> I'll attach again the non root config, however it isn't much different=20
> than the other I sent, i only fixed the weird alignment and changed a=20
> bit the start addresses of the comm region and the high ram region.

ah, and btw, just had a look at it: Don't move the default location of=20
the commregion. Leave it there, afair, it has a fix place on x86.

Memory layout for non-root linux is always (in that order):
   - low mem (1MB)
   - CommRegion
   - high mem

The error must be somewhere inside cell-linux.

Thanks
   Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f0dcd19a-231d-4c8d-9872-e962193eda03%40oth-regensburg.de.
