Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBGVL7DTQKGQE2IALOWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C93B0C3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 10:32:27 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id 12sf1020703ljj.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 01:32:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560155547; cv=pass;
        d=google.com; s=arc-20160816;
        b=K83n2m6+6RTkNWqPtuRub3KtbBx59NbulCfqSoCSHEgBCQ6VHQCZCtIbpyq0cw0cCB
         /BwS/+rMWIm0fJ2+h2an8rEG/jeV2F5akrT8mys80m5IPZ3hgRhf9n+srQ10mh4Gr4mR
         w5BwI8eBPG4oS8z/HjjCrOuHf8Tt5fTQPaiY+fZKEKfec0iojWfpfvp/3PL87WDG0ahg
         9r0UkWdcbbYgvHzvGDmvDpTn99rsdm+IG00H04v4VLnTMjOpmlpUXG4tWl6m2xbAnH8X
         E3SZxbcOhYu+BpEMr9XrwlrSduySQWGIjF7To4qrU/0oxk0aAZhqJNdp0nrUp+da5+aV
         MOgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=538etLJPv9E18/U6PmrRtOQs/XEoxjuV1+e/a1Y502o=;
        b=uCEx0FYRZU6vuyI6cRF6zeD8lFTPUpMhRs6EhJjzO8X/CKLUSos80APR7EoEaRNXfC
         w+8eXCHPdya7lwPT1BbGEZuqWAeumhA6x6rIT+g09RTwQGJdHK6sYfsx59mB6jFihPqD
         iY3g73e0X9CKZndLroz8twgWaNqbAIxCnbczn2voywxPPF2viMAOIqlBwo0u6GAndMXi
         K6IQXZ3Fwwlk9umqpzCRcnn0THvqWuJ7FD6oI7ybGlyNBd3onK2lnERsraoho+wjZCHD
         tUqe5t/at35s4XNRlZWgsfc8YuT4VOIgVIyUaM45+qOd+V7z+EDo6SABMIol5rdTe7Dm
         4qXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=omItQW5G;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=538etLJPv9E18/U6PmrRtOQs/XEoxjuV1+e/a1Y502o=;
        b=iMXaI7P4Fl8JKuAF9QBxAxQeT7xd8xLl4kHuPGRFXVAqUC4b09wj91+AVPlw5oMqy1
         x0aP6HHhiS6XmH/AoCdPxN9eRMMGXP8gORWjRrplMk4SPv9EukNsGUgyGJ4JlJbyRHst
         o+mHB26ZR6AhNiSkOViu4CgaiLjxnj+QwzxxEz08O00/CyjGYMVuMur518TkNeHIsFn4
         E/D5vQ3a3feyesgM+SYon/YqDOxUX869R9F0x3UFE5tbQCmqFcC9X7f83ST5oaqBAzcX
         5XO6/Cb7NilduWNeL6HxDUTq1Ro2trjfvCMV1zF0Vt45o3biOtV7nxhyBRCXwcH+5kCQ
         zjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=538etLJPv9E18/U6PmrRtOQs/XEoxjuV1+e/a1Y502o=;
        b=UFJFK5lbDj8tVTl4XAb3jV0MLBnL7PmVcfgQjScZaMrprvBBbu+bdq3h5BnbhdBnu3
         SEyXxKBr3Muq36vCbirTiaSB0XGFPkk8qodu25xo1dzNtUSmm5A+fqyPEQFEIqjPKZ0e
         MLofTnxt9TREHZ5J6gwmMcgsON188OofHhlphrWWp6wsH+Sq5uqsUHcO5WARDNkRi5D+
         sR0t2dFnKLh78xrs97MqWKtI/Muqo2iJmuFc9c83i6SRC5S8x4AhpAnXryAHgW5Pfimh
         E6L9B1SsU55cDn8CCoIk0foQNTPSfxFqzITkDJ0w6sXZOgmfJ1ba4vGMa8aNl5aEQyi0
         z1+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLfz68XDvq6Nm9swk7/c/Y5MCV/1LHxy5SiaX9ywwLaWYszHKr
	/uFzxDuMcwYIA1HINyPfIzo=
X-Google-Smtp-Source: APXvYqxRtbbBh/iRPbuTXG4a0x4rD8tgFMrpS+XS29Y1/06yPVDOUzRdr2It+Ydo+yakcjKYfbgvRQ==
X-Received: by 2002:a2e:8116:: with SMTP id d22mr23929176ljg.8.1560155547115;
        Mon, 10 Jun 2019 01:32:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:553:: with SMTP id 80ls192235ljf.4.gmail; Mon, 10 Jun
 2019 01:32:26 -0700 (PDT)
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr10474062ljs.61.1560155546347;
        Mon, 10 Jun 2019 01:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560155546; cv=none;
        d=google.com; s=arc-20160816;
        b=Eokfvtm+0j/3L2kGeO6Fp/OfcgQnsFZ/4tQKu+F3zCJgYykgvh4HM0b+QnHO+r5UXb
         n1tE4zAyS11zEOxnS9ffgQjdWB6xy2olXHSOZTj9D2vjf7hxxhg9zMfLGOY0d8S7IUsU
         hoekcGb8pE79Tv534vhY2Rl6dA07Ublnv7wQMnvFoCkuiGQ7LUOn2hs0A95fLmnY/e+V
         qq5dB02/yHBhnW87DwXRt1jMLvCwO7LSLqyjowZZmFmuGkuToY6WJNnfgh40Mah/4hTd
         knOmXdUc4+xyI0vbiJq57YRAZuH9kLeNzmYbSD0dS82HLAaVfDy3/xNhjQY8QFHeflM7
         41Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=LVC12RU0ZxEGFWCQh9QSDkDeizegCjVBVDDi8+w0U10=;
        b=nEjVpkBpZB4CDCQ/4TT1eqAU1K2nL3eLdZAump0+TOHSr0emq/uqHnDhN8yewunhOR
         bVsv+LSDtZl01IHuczjHYDfFoO9ra0Y//pfDiZjHuuL9ppb689MR8hirstAEpRqOfysk
         sxkhybprZ+QRHQO+d56+QMrbNBWeUk+nw8hEUBrpL4qIgrBzlLYP8lc12kX3YO53gU2a
         T0XrP6//MG4nEscXnu3eHNXKlLJyf7N8rnBs7ycJrGVYI7vW9OGotnK6lL/aMDGs5YN9
         2K5hawDnyOuf9z9QjOLcQVFqOvnxnOwsU9BWqzKQi+owUFbl2EEum+pmPjigGX0FJOAn
         FvYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=omItQW5G;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id a20si541342ljb.3.2019.06.10.01.32.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([188.96.0.15]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MfqC4-1hDCYv1fVs-00N94P; Mon, 10
 Jun 2019 10:32:25 +0200
Subject: Re: [PATCH] arm: Account for non-compliant PSCI_VERSION return codes
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <a9ac4f9f-8c5c-6133-b9df-77cf2a8ccc31@web.de>
 <4a7ef1a0-b21c-b224-7768-2b0929349bec@oth-regensburg.de>
 <b76f46a9-afd3-216d-55fc-026651ad9bd7@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c70491a5-0e79-f876-e9d9-1f4a3ec2f4aa@web.de>
Date: Mon, 10 Jun 2019 10:32:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <b76f46a9-afd3-216d-55fc-026651ad9bd7@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:tzj05wkcxmPy1d1pkQEAIHzB66O7iullbIKF+dRDs4sqRawJfyP
 EESmXVYl3RkzXMC/qOWQDrAXEaFqbkLBaqEbRKoDQ3BV/1gKatNBgQs3iFy5ppowZFRCUHu
 jCpMbO7ighhjYdBGU0qL0OtitJz+/JRSB6+1NoOnMJljmlMNuCPZwSeSNJQtsWIaCJvWZMJ
 Lig8MhIBFFTgtPqMPGdYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xq38tIXxoRE=:zRUWgx4qsmTfsPfxr1AUBw
 z5T1Cs4EsNl2DNu9UmTXzhN6Wi+PdB/gATYAMJKS9PxQRvyQRZex5Gh7tGjmAQY1Z2wCYrq+F
 +Nf4qc4dcmlGf22vKDzffwk5l4pVZbDIEl5xr5kx0NEllUVffE20AehFm/hsVrFI1d9rg7C2i
 hzthQAcXJkuGb4tSNOolAm0ef15PvxXtUbcYnQyNxlrEyfohsWjOTLPV0QY7Ag9AkNvnEDgaA
 VEj41rqrafu1CaBg3E/RJBlG6uBnQqUHBh7i4jgnVmG5dUHnp1Dx27T9da8dpbzcCrkp9hyuY
 QZCX/9euOkhqiG1rI/qibADL/gOcIhBl5nrfxnfUxa6MUztPxAdYM7hK2PV9r5BvKnyM8XfZm
 9t6th8i5jukI53H4Y8gcOuHMcXT4jo751t+Gpeb7ZGK7BSqghgp9eiqMVwR6vNQyhBbCfjAeO
 0BFtlfYJwdoNJ1Q/nYWFRHn0p+ZaC+qEefxiZZr4EspbcWOwdKmqpAk3qy3QhLS1GxOnhEtLE
 hoUWTq16/lvnqNQClEaQK5dhtlZu5dIR0aj5BV1RS04sHaMO/DLMV6R2piDWFWmeIvi0/oPzT
 oJ7xZkmnBPjVu34H0clMao12Z3EC93hH3NzE9c4RmDMdPOQiQPvhJ8aNY21fTX9VgFg2pV6Un
 pz/2sjznUWs4CErpKIP/eiAOMWADHzoWI7W9t4uIT4ebYhr3XfJ5jaC1zqDSFp8nYRlmCfJlX
 uyNP8hcKfaQID0bEU7/VrrwiGGSDkxM5klILAUqJFjug29YHJWC84NCo5KBsoMtDVJqNL98hN
 J/HYNMo1mbLnkiExKeQZW8KD2rKYnjkNcodinJRPcpmONbwdZ8YKpXhQ7Zv7BpAVNdNd+fQXQ
 GZZt96/q+XJ1a2E3RJVXQuKHoKKvTHvhqaXLX2TDRcr7PrcPXeuiUhGKcZFcEiCo333BvFAjy
 Qqev2Kpdc4HUeLf5t9T3nj2lHwHvng4ahpQSY6m0aDGGh98bZyxSf
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=omItQW5G;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 10.06.19 00:40, Ralf Ramsauer wrote:
> On 6/10/19 12:07 AM, Ralf Ramsauer wrote:
>>
>>
>> On 6/9/19 8:58 PM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2.
>>> Filter out all negative return codes.
>>
>> Oh. We should fix this as bootloaders are out there that do not stick to
>> the specification. Nevertheless, should this be reported to u-boot?
>>
>> I remember that I definitely tested the series on a TK1, nothing
>> exploded there back then. So at least the TK1 seems to behave differently.
>
> Oh wait -- the TK1 in deed returns -1 for the version call, but the next
> call will fail. This is why it didn't break there.
>

Right, forgot to mention that in the changelog. Will tune.

>    Ralf
>
>>
>> Anyway, tested this on a TX1 w/ and w/o firmware mitigations, as well as
>> on a TK1. All configurations seem to work fine.
>>
>>>
>>> Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Tested-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c70491a5-0e79-f876-e9d9-1f4a3ec2f4aa%40web.de.
For more options, visit https://groups.google.com/d/optout.
