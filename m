Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGGZ4H6AKGQE3CSFSDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DBB29C7DA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 19:53:13 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id 76sf1141061ljf.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 11:53:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603824793; cv=pass;
        d=google.com; s=arc-20160816;
        b=auV8mnZMR5YoXPm/dM4GqvNAeM+tZWBujTNAN/lJQ1dHwhVxyhhQ8xvt9llbZZTKel
         TINomf0F0hcPfh9eg5oZqB7No2xDAq7bKpJGQ8dCL+kA38bnMklcJb0H+x2Ua8ZG7XQ8
         F6ph0B+iY4QwPf9aNE0o5Ub+yEMoT2zsbKP9fCV+6myFkVC+oQMYBmuthvw9Tz+IBvVY
         2brpC7h0Rrp5kmDNh7pB9ahHztr5yyyl/sci5+l+uqWvBjQpby8RmfjIGclkxknhbJgL
         TQC5fAnAYBUIG1TXC2JSLjP0MyuYSxGxAbLqPOsvVeO4IGCRfwbMR5HrLaIgoW8lyXtX
         wV1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=V1Mk35Wy+4BJF9N+oXMMypHhTMOGhZAWfPEJaAIOQig=;
        b=V7oXLGzoU1bKPakiHadHJvLGrTCktyLS5X0Cz8igqoWqEAR3tZeBAtKX7wO+SFISF+
         VcPLirwcB2E02jNVkYdNlAO9GVOx9pfH5HEF9uKy5bXh50SAFd7KB5cxIXMKhwtwZst8
         kQmDJqsRPInkPL2jhwnGJUwc1iZ4nxmKrV4Sew28oRMo9hR3qYi8Kclv2J4265QG2819
         1hg2nPwp0Y3L/TUiis5ygDKB/sHVuWkfWwAzbARHZnNq3NfwFwlvXzIBBtJX/InbJBvY
         bFMBV6oagqqGYFbatqA7xBKKu+zOU7qkt7L7YaIq9vMTCTHI8MKEz3ydWYgesoiKxZVU
         M0ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=iAC5n8iz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V1Mk35Wy+4BJF9N+oXMMypHhTMOGhZAWfPEJaAIOQig=;
        b=BOUJOzsw1n+4Z3a0sd25Wl17srwP2dEhZLosRspq5hVgurNR7mk7B5xHIQEyrxXhCH
         oaGqePakmY27CKp6tdCup09vbJH5E2fIImPgT4HkZdT2skvb4f+P4yvJNPfb7XZdyhvF
         mWufC8MGWnqJd70PQ5SaAJfV8674yumze+FwLddWvTL4YbCTuuJtCkTeTS14ilMuwUUw
         aqBQmglOXXre6ovkjA/BIVMJhuoFlFu0oRgDfofXV69PMuY5Lu219EdIfIoUaBOsWq7V
         MaAzZL/g64pjaAf3ywWZ5n2mHPby9GDHN/r4E+8EwPsBoVTMmK7r74W+BIt3D/h/ECcb
         tzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V1Mk35Wy+4BJF9N+oXMMypHhTMOGhZAWfPEJaAIOQig=;
        b=sMblSLEJXV6Gnt6UR2onUVsbEE+lbkwdbuDk/MZ2BjPwWgM1smQ+AUdKgtVm/in8/N
         D+ceFzifTLt7EDEmpdJNb1X+D96fO1fejKBkkYWU36haSGctIYaq5c76JzXyi0Ne/nIs
         XsItuhxI0bP23F+pgh2aCroq/4BxaViJtn427Sp8oEA3TjegTcD9ZvRkTnAsJJFlVXa7
         DZKTDPXggeFjvJmmOn3AYA26w4oWNILGhrkyO1jGn0q+ibP5npFsOdStVsKEnYEUxyl/
         wQT2L5/JVC960G66+KNhCZUQrOUXnZKGNAGOfKkrQStOWeP6gvLzGQCtd9P7yurDNtfb
         BJsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DAk7sl2VpSrAzYkovRGF5T/YekgMrSJFMu5UJJkeAZy1XtWUH
	LYqJU185lcWacE0Wf0jEEWo=
X-Google-Smtp-Source: ABdhPJxmDpcVp1EZ6Lhe554hds0HdzrbdST6K0Nxfa2CPZl8zKYnaDuEsNkorarMd5g7cT/3uyMAjg==
X-Received: by 2002:a19:cb96:: with SMTP id b144mr487419lfg.533.1603824793316;
        Tue, 27 Oct 2020 11:53:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1341444lff.1.gmail; Tue, 27 Oct
 2020 11:53:12 -0700 (PDT)
X-Received: by 2002:ac2:598d:: with SMTP id w13mr1480819lfn.11.1603824792065;
        Tue, 27 Oct 2020 11:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603824792; cv=none;
        d=google.com; s=arc-20160816;
        b=hT5zSGrSoAGy23jv6Tv8Y6+Cl29DsEtg+GhGONEjEXqqtNbP7a/by2NwMD/jAvtMQh
         Yg8nPw61pOJ6cz7hEwew33ueNU2WV6zEFpyBEI4GUaUbtwGnywQlfPUJQj4TbQZhamNV
         LumrJOxvcgrvre1EEmJVafAep5yQAirvIqnctHZzJWbRMZWu8oaMPQ/8lmAGPmGWqj3n
         k1Etl9/+2SuLBT3URsAMqYp3/JFjHfJegdmUVh6O71BU3uTGOr3LnSCSS0xK6eVSF3y9
         8SjJQuwNArkp7oe8q+lE8JyjRtKS8bzCpqqabb2jOQq4fGietaWkOqF/dIYx/THJq57u
         7lQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=BX+yR4YgAwU06ukd7mZ8G4X4vNRUlPGXqci/wUUwTGc=;
        b=ajLenHHwzXZoCFWslCieHc0Cd1m1F7pNgD4ySW3EnQXm6f+l0vAfStepCR2W5ql7jF
         agZO97AO/tfdsyLRk8TzYddN1SJO4N5IHDkCK9jrbD0DqyoT8ZH8t4In4ZsWsapsaMJG
         a9EO20xFQdx59g4kJaOANV65oB4BlZ0qXcG8Z8YI4Ge0N12MNyCawBL3RkdqIUhlu3aH
         SicMo854kUQ0ufyHxzQmxK7cxy8gC5PcA3acZC5X4FZFk40y2gZKdz49Q2WaLvevnvMl
         TmA3+bFi6wl4DIbjO5C+ISqWdF3teXLjOTU18IeYEywRsVNFjdESmD40Hl8wM9cRoBoY
         7v9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=iAC5n8iz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id k63si50633lfd.0.2020.10.27.11.53.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 11:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CLLSR2jtvzyTM;
	Tue, 27 Oct 2020 19:53:11 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -5.04
X-Spam-Level: 
X-Spam-Status: No, score=-5.04 tagged_above=-999 required=5
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
	NICE_REPLY_A=-2.167] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id EUCGn9sey3vT; Tue, 27 Oct 2020 19:53:10 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CLLSQ4PTzzyTD;
	Tue, 27 Oct 2020 19:53:10 +0100 (CET)
Subject: Re: [PATCH v2 12/33] hypervisor, arm-common: provide an explicit uint
 INVALID_CPU_ID
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-13-andrea.bastoni@tum.de>
 <12a22fcd-2e7c-8d03-195b-b363f8e34019@siemens.com>
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
Message-ID: <00dd9db2-3af7-a1f0-ddb9-0ef73aa7fe68@tum.de>
Date: Tue, 27 Oct 2020 19:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <12a22fcd-2e7c-8d03-195b-b363f8e34019@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=iAC5n8iz;       spf=pass
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

On 27/10/2020 14:10, Jan Kiszka wrote:
> On 22.10.20 19:58, Andrea Bastoni wrote:
>> Substitute the implicit "-1" occurrence for an invalid CPU id with an
>> unsigned int INVALID_CPU_ID that can be used in all "uint-related"
>> comparisons.
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/arch/arm-common/lib.c       | 2 +-
>>  hypervisor/arch/arm-common/psci.c      | 4 ++--
>>  hypervisor/control.c                   | 2 +-
>>  hypervisor/include/jailhouse/control.h | 5 +++--
>>  hypervisor/setup.c                     | 4 ++--
>>  5 files changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm-common/lib.c b/hypervisor/arch/arm-common/lib.c
>> index 916cd54f..889b3d14 100644
>> --- a/hypervisor/arch/arm-common/lib.c
>> +++ b/hypervisor/arch/arm-common/lib.c
>> @@ -31,5 +31,5 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr)
>>  		if (mpidr == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
>>  			return cpu;
>>  
>> -	return -1;
>> +	return INVALID_CPU_ID;
>>  }
>> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
>> index 6a9abf60..242cad5b 100644
>> --- a/hypervisor/arch/arm-common/psci.c
>> +++ b/hypervisor/arch/arm-common/psci.c
>> @@ -27,7 +27,7 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
>>  	long result;
>>  
>>  	cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1] & mask);
>> -	if (cpu == -1)
>> +	if (cpu == INVALID_CPU_ID)
>>  		/* Virtual id not in set */
>>  		return PSCI_DENIED;
>>  
>> @@ -63,7 +63,7 @@ static long psci_emulate_affinity_info(struct trap_context *ctx)
>>  {
>>  	unsigned int cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1]);
>>  
>> -	if (cpu == -1)
>> +	if (cpu == INVALID_CPU_ID)
>>  		/* Virtual id not in set */
>>  		return PSCI_DENIED;
>>  
>> diff --git a/hypervisor/control.c b/hypervisor/control.c
>> index b38ac2e9..0078ef19 100644
>> --- a/hypervisor/control.c
>> +++ b/hypervisor/control.c
>> @@ -48,7 +48,7 @@ unsigned long panic_cpu = -1;
>>   * @note For internal use only. Use for_each_cpu() or for_each_cpu_except()
>>   * instead.
>>   */
>> -unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, int exception)
>> +unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set, unsigned int exception)
> 
> Overlong line.

OK. Didn't think this rule was too strict when the readability was slightly
better and since I find other places where it was not enforced.

But readability is a subjective matter anyway...

In addition to my patches, should I fix the other occurrences or do you prefer
to only change those if that code changes for other reasons?

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00dd9db2-3af7-a1f0-ddb9-0ef73aa7fe68%40tum.de.
