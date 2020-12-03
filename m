Return-Path: <jailhouse-dev+bncBCW2V5WNZMERB4MFUT7AKGQE7HJILOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id E98692CDA11
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 16:23:29 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id m16sf805455ljj.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 07:23:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607009009; cv=pass;
        d=google.com; s=arc-20160816;
        b=UvyzQz8hdw58TOUfur8xbKayxtIbHiIaJcpdD6rCfMQYtm2uluyvg503jtv9C6GsbD
         6+u1uAmOWzLpHOwUAw0a0uAfAUc/ZXJZ2jM1l9ADz1t3r3uuV3LrvVPUyX1QakT6yYj0
         2U2q88eTjKUEx/YPRwN8Osz08T8HuJL7otYhPIeALL2EoxI81Ph+Er74z6RTq/1AAT0w
         u6/XNvNp6i3hW9kHD0LuZ+GFdpFMDL9Kz04wDlhpBpv2raZS4XqLdarsIwUnFhElGvLg
         MLxDO757ITXf04CabS8Fr7gx2QK7NpDmIE1JaEdtTtADNtLjZUV/TG1hgfGYJdff2A+v
         eL3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=+5j/KHPr4zzuo0e8+ElaOuH7OSy64XunbfwUlPkMrtI=;
        b=qnEx+Cww+Z6u9zbkzYS1WDxy1cKaGV5borXw32PxZPWKlhD5wSFjvmWF09b0pFkBpA
         +f4xHjimJIYHBeOg2UPWWTaLiAp636gQI8bMuQh85NWGq3+P66RSYbxK/FmvA6ET/7yy
         xsXoKY+hg8TYfi9eJHEDkoomVEEUQ1zbPLiZZqcSMlwsmDGpzy7N3GAUEdSMlLfQ3hhp
         JxCDoLOcxTKL6h2MNGpnmeqdXcxSXue0+IuyG6orREtupYHGjZdP9JnurUEo/X8LuHYp
         RnRw4PiZSZRu4jSRrlkBC6rFtoVbjcKCJNgjHGjONOKQhuqKiGs60Ml4NxHDlMIwTO/D
         Zwkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=tdrsI44J;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+5j/KHPr4zzuo0e8+ElaOuH7OSy64XunbfwUlPkMrtI=;
        b=kGkPkzy+oQn8xYwCLiyCrYPR8h3m3GQXraa+MrFYfHxcrry64leDQ+WAmf6JsmiVR/
         mFbt00gFp/JRKJt6iUH+HUvqF1laAjyJ9lTpxtmBARyPslnBjfY/YmifXBgc9gKvKp+g
         3xh2R94/2S6cdgKprC54uioi6Mju6nyDl1AsTARqzZ3so7CDzcHFDfXTd1OieXJYl3PH
         L3TamTq4RPe5QMLUkM0wAtxvujAzt1tAMTWBgDuqYSNxk7F3lsaRCMo1Tv6xpqgGtXxO
         irCHbW0JOVYUzn/wZ3Uqvwn3WOnT/Bxg9C/gLwOrW/qyA58SmHGbT/8G6BM9/l0jUBKC
         KL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+5j/KHPr4zzuo0e8+ElaOuH7OSy64XunbfwUlPkMrtI=;
        b=bMclRQ7IoavCAUoslEndDX77FLI6XpB49l6TYRqF7ShmlmsQP3fkEH/NtNgl3e2Wzf
         Z3f7hJ7hS46C28j3XAJe10zK7wCXRRzpQMUS45lnjJLuFHmhalQyNdtYaFgyP0TLQq0Y
         Q9rfC14VIOFvPw/9aP96K2BBcKM++CACnrj5fDLbkoEpRxQyV8xHiV+M3plS+04fmDgj
         Jv3XaB8PxWXUmGDCiEL+DZMjz2c3v1NSOOTmtwwtiqXVhkNZjvLWgey1IOXZdW3wciRs
         vXnM5aqPrfRZcgAiKv04k3E4rDVwj58ztH4ZxFJ+JLlXGqMGBP0sBaTvP1RXk54LCqI0
         PXVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530AZ6hCEFGqo/U43XEFvyEUmpBPSTOHxhBDMT5+z5PrIhVEStlg
	XPWHwhvQE9w1y8yOw+CeJz0=
X-Google-Smtp-Source: ABdhPJxTNTplHlRk2jScM9IPGpUccKVmFYslhLt4zSYh+gncUz/1o+UgbCxNiogVVI+TJ6+Efanv8A==
X-Received: by 2002:a19:7d04:: with SMTP id y4mr1484315lfc.344.1607009009500;
        Thu, 03 Dec 2020 07:23:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5a02:: with SMTP id q2ls731748lfn.1.gmail; Thu, 03 Dec
 2020 07:23:28 -0800 (PST)
X-Received: by 2002:a05:6512:48e:: with SMTP id v14mr1610180lfq.255.1607009008343;
        Thu, 03 Dec 2020 07:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607009008; cv=none;
        d=google.com; s=arc-20160816;
        b=yS+BoYZHqQ8IZ2x86b9GgaNwxg1EQWP+IdUMu+k+R4Ik9zo/ll6rhp0Mtg+qtDW5nq
         eNGTOpoIR3kB9Jw4rUIHK9fRMXh8qyCn7MR5cM7aoWDpPAEpkiF9Y+i8BLyWkgr98YJ+
         JdO/Xy3vhtAl5sCtux7IN/toVAtifPzvJPJEuFuIbW6JASXBr8qO2iGdhlaKZCAMTusE
         0sXP+hyvsrZ3PPH/hkPdEBGXI4CibJV+1opZeIboai+eLkU75ZefAlrWC0kwJv0CrcTg
         VuUPHJXOHLDZnvDVJrQylISH5b7MWGMo/6ugSoorMuFxxJNqsnfmiLx7hLgC0p/LP3Yw
         c8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=K65rw3o5br0hQSexqOpEyjobo8+14fNu9Q3WHfWLWBM=;
        b=bpKzhrvCBwSfm5Q3Epb3R1P/chmARLonIAWDb2/lgYRAQZWEaWIxIylUSKMDzUn/GS
         fFeQ8zJ/1wRq7PIG3f57q0AEQoOq/QgnUerEtGbePCPayLT2upAdu7z3sqNmnC58Hz3R
         rYeXgsZc20Ef+PNT/RQP9HpzC73x6+YMVyJYbKPK55VXBQvnANUVuLV5jsYocX0hiV+9
         qjOx7oT+tKqXr3GnvohFGJvERysTPQ4UKYEIVrWhwyDt8Au5UbqjJ33PRFQiVZ3JLMSc
         0SI+wVsmSBpVlZjk0CUsom/5QMXzxr6qETtFjArIXyMim4dS8X8Pa3kuyY/eOQLZRb4F
         ZFYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=tdrsI44J;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id v2si24293ljd.5.2020.12.03.07.23.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 07:23:28 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cn03M4XChzyTj;
	Thu,  3 Dec 2020 16:23:27 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level: 
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id XTe6ZO5_vHAN; Thu,  3 Dec 2020 16:23:27 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cn03K1wCJzyVl;
	Thu,  3 Dec 2020 16:23:25 +0100 (CET)
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
 <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
 <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
 <6c4ee376-6573-ecc7-2e50-f6a74156fd75@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 mQINBF5Nh4sBEAC7UM3QJtjrFO3pjcMCCh04JFyCCDzLFMIqMTB1UWCLamZ9dUwIau7ScgWv
 49aqbM++edVvEBmG8JHDC83DFWymvFVXBgqgcR7tHHBbg33XJKFMHvuW/kFm/67XPTFcec4L
 JsH5MWms9TLJbgCnaWQQMH3kztTRQaf5QcULIoHnTySKlt3WzzzHosaMO+/GNYX7vzfc4ypJ
 mD5SQWYDhfRefASkyxdrN6/QkPwS2vGTyVK58o2U9I27KPYvs+77JrjrNBfpnebapaYVA55C
 7BvTnno5Kr6QHwA6LcnIZqefz7KxQ1n+1C5QQbmhi9S68aloGCeUo9R06UMJG79TXC2Mc68t
 AtSCN/HpgcvN1CSL45f/4WCDPG572ebo5M6MPcTb4ptV1SC/i+4U/3cG0LNSUap+sGRCf0Iy
 C5xy0KOtgoq8jesdleSy8j/3DNIMGekSYbQYMO39DfZds2XFh9lVDjG7tQcChwW+lQDPo113
 ENBRftDyqJthrvmJXGyrOmn0su56qh2Zqvi5pSHWsH88vAZUJsOU+9lpohmcb3o/cQ18UXNK
 H/9wjo2zKHFdSylQFERHIzj6WlBp01wkTcCqtUGpxsjJHmVSyakWs3TrGXooKR9SPMxqVrD/
 oCCEo9IUD9jd+TxLsp/4TzUp4ScTO/43uPgdkMekU5mRs6B6WwARAQABtCZBbmRyZWEgQmFz
 dG9uaSA8YW5kcmVhLmJhc3RvbmlAdHVtLmRlPokCVAQTAQgAPhYhBImpnm1L3x9XIoXhD3VS
 ShFTR9xSBQJfUIpJAhsDBQkEYCWsBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHVSShFT
 R9xSLe0QAK3foeET0JtmmthVpjDcY+vvz8cgZuYlrkJvP6iNJSilxlvKfpnbOJYvzJLIvoQb
 Prpa38kyEd18XL6bS+PxySbHrt3Shl2S4undP2wV3yaoMhdEk6vs8QK4S/ax5oeFuidU9DFb
 wUFtgANvG1SMLlP3TBQIc1qCtDeMWzxqvwLcMLqb/7eLeeVsDW8CyrL1FpWzl8klumVii8Yl
 lNRUco2fAcfe9Z+LgjbBBTuhrUgxd2rK6FajM8IHwxcWUVON7v0KgUTkn2IOgn+dGZF0X65q
 KSeR8bNQ6t+9EK2iiSLXXR+XaduaY/wh9fBG7kwGwu5SQ+oM51C5nljHzKT0+NjgdQ3oOhpB
 R2tJUuvblyUcU7v4Bw9f5wmeU2zJxyxGyzgmejQUkgH8uAaY1AECR8KydBmfR3fqefXGh78F
 FRKE5speivdDebyR7Bw8PTdUkCNz75MVHm53XHq2MRVferRtPY+Fp0W6gqo1pIoniDvKLwM8
 q+a3SF5VWwdNDJ3mk7wVCbWsoEGEkXVMffYMUbBRNQaiNb4M7RYZqG3e/qvUIkh31lKaeECF
 UMBK3JBELc5zKETZroZrYjhscbvDLYp628r6xGo5Rd5dDPfMYNnWjiZAejmCPirY995fUvb2
 jnOOHflLE8SwYdXxUim/qrl+PigRAux3rtDmHiTZDSSnuQINBF5Nh4sBEADNJ99l+vOp8LB8
 jDjWOhINlpgp+EcrmWOuler5QnoJUywc2zkLelQIwVGP2lFliMdLHM6DbMEXySIzHbhw7oPR
 P0QRPK/6I4bXYkSQCrLyqYd0CYSbkar8YV6Xa6nGxRmP1bBv1lPFHN66D0yE/z1ScGMXyX+Z
 OIvH0ekIkqFvi7Ec/7a/ntfU43o2t05dmbnEKoECZgeS8SraojfKnQRpz7+PN0q45O5fMETZ
 pIiQh1/mB12HOcklDNELcKohqVfevbknJw04Yjbcv79aGpBRqoVWWBS4TxcDCRPQZ+H0tMUV
 EL/MqO7tNLA1VuGpOccyFtZnC/+J/twa7iKpPIxS9Ec/LDYTddebWH+8gOmr/PkBerBXghlZ
 pxmQUlJeQ8kyecOOc4C7ec3aUGj+x28j0+zlXFLUbjiKIEM5VowIMgDDRwA/MDr9IJhFzHaY
 2VCfBnX8sgJSn62IxqREq4X3KkR/Jtxt+HYXQYLl0yva2MBplkRcwQO799o6woAMW0uyct4+
 BUcKo1sBFP2x2n4NFiPEjeoH3y9baruD9iiMQsmbJ3IKqtT13crCa+bcY3ZSOz+CymgzNdH+
 RabJMC3mGfKIhUQGwEHz+wyMnv16nqO49bmoCk3q5Oneo4I3XwI3QbIJr0rdQkX6oh6R0taC
 3naal1ZYGxs0vZK567bT5wARAQABiQI2BBgBCAAgFiEEiamebUvfH1ciheEPdVJKEVNH3FIF
 Al5Nh4sCGwwACgkQdVJKEVNH3FLafxAAl7pW0v6Jju19I6wtB+XNzzi5Wota3AyWzCxO/hUH
 NGRV/ZufhMkNFCMNzAxbdmO56eCk9ZYf/JMLu8H1GwhV1NgQ7HL4FNXXxLZ0ixZDik86iiSj
 VLtEjLuwkS4Fj9wjqevycL/t16kJduFNyxT0/XiB5UPh5NClOMonHSC+V2IfKf6l2Ic34CrA
 3ovkfVvBXJTzia0VgyQCikeazgPRELH8bq2WTBWfjR3/l86Y0twiYyXqBNQ8Q2Z83mu+yt38
 gTanz4YuDYz7YFjvL6IU2MZ5+ByothK6Cfx4W595q81dsGcJOlcd6j3QE+psb3SHuToWZCHZ
 RHyKrgGDqCL5RbsK3wXgDmc48SfN+5TxenT8A1lkoOHFcQ0SV8xleiwURXHcAo+SzyDcTflt
 BNjzQmntQjAfq1Lq5Ux9nfpPMgnVHu5ANWeLtwLJyh+4aPVE5hGjeCa+Ab5UMyocCYdTuAmD
 HB9RQdf9c+qlVYuZCg7yYlWsvId5DGZnab2MzvExayaFCJVEoCccpfrqFFiFkJ19BogE4A6V
 TU0ShoHYJhLg7PuEZS1oWzULZnM8sNNI72MecvfZn5Oi0ZEJhFh+HETlJnIT7gh7CGFBxPac
 T8vHxmeMPod7qrvYgKW+QKhU+tAI8gkI6hHXLBg/dxn7wAwTjlX1bo+jRJypId5SuAU=
Message-ID: <540d5217-5b22-a0a5-d067-304c49e82006@tum.de>
Date: Thu, 3 Dec 2020 16:23:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6c4ee376-6573-ecc7-2e50-f6a74156fd75@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=tdrsI44J;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 03/12/2020 14:44, Jan Kiszka wrote:
> On 03.12.20 13:48, Andrea Bastoni wrote:
>> On 03/12/2020 07:36, Jan Kiszka wrote:
>>> On 27.11.20 12:41, Andrea Bastoni wrote:
>>>> The SMMUv2 allows filtering bits when matching stream IDs before they're
>>>> passed to the TCU. In this way multiple streams legally get the same
>>>> translation.
>>>>
>>>> On boards such as the ZCU Ultrascale+, the master ID needed to identify
>>>> the corresponding SMMU stream ID may be dependent on a specific AXI ID
>>>> that is set by the PL (and could be IP specific).
>>>>
>>>> One single fixed mask to pass to the SMR to compact multiple stream IDs
>>>> before they "hit" the TCU is not flexible enough. The use-case is to
>>>> compact similar PL-originating masters and have the SMMU behaving the
>>>> same for them (e.g., they're assigned to the same inmate). At the
>>>> same time, one needs a full stream_id to assign e.g., different GEM
>>>> ethernets to different inmates.
>>>>
>>>> Update a stream_id to support two different interpretations:
>>>> - for the SMMUv2, provide an explicit mask + ID.
>>>> - for the SMMUv3, keep the current single ID.
>>>>
>>>> This commit updates the SMMUv2 / v3 --including configuration--
>>>> accordingly.
>>>
>>> CC'ing Nikil and Peng on their affected code.
>>>
>>>>
>>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>>> ---
>>>>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
>>>>  configs/arm64/imx8qm.c                  | 16 +++++--
>>>>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
>>>>  configs/arm64/k3-j7200-evm.c            |  2 +-
>>>>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
>>>>  configs/arm64/k3-j721e-evm.c            |  2 +-
>>>>  configs/arm64/ultra96.c                 | 11 ++++-
>>>>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
>>>>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
>>>>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
>>>>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
>>>>  include/jailhouse/cell-config.h         | 18 ++++---
>>>>  12 files changed, 114 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
>>>> index f13ca7bc..e8e8b217 100644
>>>> --- a/configs/arm64/imx8qm-linux-demo.c
>>>> +++ b/configs/arm64/imx8qm-linux-demo.c
>>>> @@ -19,7 +19,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[18];
>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[1];
>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>  } __attribute__((packed)) config = {
>>>>  	.cell = {
>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>> @@ -194,6 +194,9 @@ struct {
>>>>  	},
>>>>  
>>>>  	.stream_ids = {
>>>> -		0x10,
>>>> +		{
>>>> +			.mmu500.mask = 0x7f8,
>>>> +			.mmu500.id = 0x10,
>>>
>>> Would list id before the mask.
>>>
>>>> +		},
>>>>  	},
>>>>  };
>>>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>>>> index d63c73cf..2ec4f4dd 100644
>>>> --- a/configs/arm64/imx8qm.c
>>>> +++ b/configs/arm64/imx8qm.c
>>>> @@ -20,7 +20,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[15];
>>>>  	struct jailhouse_irqchip irqchips[3];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[3];
>>>> +	union jailhouse_stream_id stream_ids[3];
>>>>  } __attribute__((packed)) config = {
>>>>  	.header = {
>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>> @@ -54,7 +54,6 @@ struct {
>>>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>>>  					.base = 0x51400000,
>>>>  					.size = 0x40000,
>>>> -					.arm_mmu500.sid_mask = 0x7f80,
>>>>  				},
>>>>  			},
>>>>  
>>>> @@ -209,6 +208,17 @@ struct {
>>>>  	},
>>>>  
>>>>  	.stream_ids = {
>>>> -		0x11, 0x12, 0x13,
>>>> +		{
>>>> +			.mmu500.mask = 0x7f8,
>>>> +			.mmu500.id = 0x11,
>>>> +		},
>>>> +		{
>>>> +			.mmu500.mask = 0x7f8,
>>>> +			.mmu500.id = 0x12,
>>>> +		},
>>>> +		{
>>>> +			.mmu500.mask = 0x7f8,
>>>> +			.mmu500.id = 0x13,
>>>> +		},
>>>>  	},
>>>>  };
>>>> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
>>>> index 90a0ce4c..ace9cd3a 100644
>>>> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
>>>> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
>>>> @@ -26,7 +26,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[19];
>>>>  	struct jailhouse_irqchip irqchips[3];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[1];
>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>  } __attribute__((packed)) config = {
>>>>  	.cell = {
>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
>>>> index c3ac331d..d0c8aee3 100644
>>>> --- a/configs/arm64/k3-j7200-evm.c
>>>> +++ b/configs/arm64/k3-j7200-evm.c
>>>> @@ -21,7 +21,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[32];
>>>>  	struct jailhouse_irqchip irqchips[6];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[1];
>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>  } __attribute__((packed)) config = {
>>>>  	.header = {
>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>> index 5b6aa82e..1b8b3c4c 100644
>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>> @@ -27,7 +27,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[22];
>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[2];
>>>> +	union jailhouse_stream_id stream_ids[2];
>>>>  } __attribute__((packed)) config = {
>>>>  	.cell = {
>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>>>> index ab13fedd..aa5b47a9 100644
>>>> --- a/configs/arm64/k3-j721e-evm.c
>>>> +++ b/configs/arm64/k3-j721e-evm.c
>>>> @@ -22,7 +22,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[40];
>>>>  	struct jailhouse_irqchip irqchips[6];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[30];
>>>> +	union jailhouse_stream_id stream_ids[30];
>>>>  } __attribute__((packed)) config = {
>>>>  	.header = {
>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
>>>> index db65ae01..19be84ae 100644
>>>> --- a/configs/arm64/ultra96.c
>>>> +++ b/configs/arm64/ultra96.c
>>>> @@ -21,7 +21,7 @@ struct {
>>>>  	struct jailhouse_memory mem_regions[11];
>>>>  	struct jailhouse_irqchip irqchips[1];
>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>> -	__u32 stream_ids[2];
>>>> +	union jailhouse_stream_id stream_ids[2];
>>>>  } __attribute__((packed)) config = {
>>>>  	.header = {
>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>> @@ -161,6 +161,13 @@ struct {
>>>>  	},
>>>>  
>>>>  	.stream_ids = {
>>>> -		0x870, 0x871
>>>> +		{
>>>> +			.mmu500.mask = 0x0,
>>>> +			.mmu500.id = 0x870,
>>>> +		},
>>>> +		{
>>>> +			.mmu500.mask = 0x0,
>>>> +			.mmu500.id = 0x871,
>>>
>>> Only realizing now: That mask is an "ignore mask", right? Bits set there
>>> are NOT matched against the id. That's modeled after the hardware? Is
>>> this really intuitive? This one confused me at least.
>>
>> Yes, it is model after the hardware. Maybe "ignore_mask" or "imask" would be better?
>>
> 
> ...r invert it in SMR_GET_MASK? Not sure what is nicer. The latter has

Not sure what you mean by "...r" ? "maskr"?

> the disadvantage that you then always need to specify a non-zero mask.

Not sure that inverting it in SMR_GET_MASK is very nice. The mask is 15 bits,
the "consider all" would be 0x7fff (and you start wondering in the configuration
why 7 and not f...)

What about "mask_out"?

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/540d5217-5b22-a0a5-d067-304c49e82006%40tum.de.
