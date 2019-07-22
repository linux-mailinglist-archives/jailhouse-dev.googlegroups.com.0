Return-Path: <jailhouse-dev+bncBAABBNGH2XUQKGQE2KUH4RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id CBABA6FA30
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 09:20:21 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 12sf8272236ljj.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 00:20:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563780021; cv=pass;
        d=google.com; s=arc-20160816;
        b=aPX7g9AAqtHuTwy73qGqmNCF0r6ss6egeZbWrhfdsLyCpMD0GsyXmfPdHFTov5weyn
         GbcW5LssNGE9r0q2ByY/W40yqftvX+abxWDNDn9HOqgoesneIGK5ipEuKycTpmWfEJhC
         mjCWg8opxt/mfScsMS2BMTlMwj9w4lul6d1z1YB0wLaQmTD8oF6DeqB3WGGoUd+qFVN/
         UNU6h5N0ZQuT9j54bG5TlEPSIP3JD+exAIg1Vw1cpJHdMuiXMyvCy9UKNF6hReAUtuAg
         2nX6kHfVotT11JqgFGxKe2IxB6EL35sEzbpmi5XI4fCaXVUUlGYrSEUTaqw1PYH62vTk
         +2UA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:acceptlanguage:content-language
         :accept-language:message-id:thread-index:thread-topic:subject:date
         :to:from:sender:dkim-signature;
        bh=sLn4jxsMh8wztcwPBsngLmkKKZSb3KGt5VvNXQqxi9A=;
        b=ElmE7+iZXXEkEbaaKjjySaPj4xWUw9AqhEUFkRvMwB0uEUBDy3M5nxWEKoMrQC9keZ
         RxlScIbvmqqdsi9kTnBCdFv9tMsV3HZqeV1hk4SR6RuIIDBPyg7BU5RUdsWS1W/UKkqE
         D7PWfY5fParmpuVU+qYaW9lwXVf6mGfaNbYHKEsFzumt7yj5/rdc/XtaZUBD3FjFE4Za
         iQ2yKDBle9RihxL9ADT+SI5QXEo5b+7YiMU6ZGt/2OKw75AnNUdwa5UiLRFZza2HtqNV
         fcRj1myvssZlJm8m87x+SKR42HMOvsfNRK214LwD67Qnws2h3Sy/J+Dq35qlMm91Cork
         ilJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:date:subject:thread-topic:thread-index:message-id
         :accept-language:content-language:acceptlanguage
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sLn4jxsMh8wztcwPBsngLmkKKZSb3KGt5VvNXQqxi9A=;
        b=J8F1JhMxuNDPbasqVWZGpgZ2FqL3DRNF6fT6eHzjHfOsHuLON1+zs5g55QlpL9GmQu
         hYXykBTJF91vEGaGRGz/IoaMH1YG+++S6m54Y+z2tSUmzAimtzQX81viJUw0j72nFM/6
         FbN+K61wfqjHDk11thV3Qs4VQ1yVK+zt3an4AUHbuw8HsvoNcXMVoxxy8NsX92lmKy1S
         g0vy7u0n+lG9LijXdp+r9/K68eQ4rsI4k6BglXaRB15l23BaSKBucXuVEUwpCHrDUONB
         NqF6O2cvRiQij2k32WVc91boD5NOpxfbsIgZJ9kJ3lQnpSyu8yfRxVLh6L8HhJ3TYTV6
         qw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:date:subject:thread-topic
         :thread-index:message-id:accept-language:content-language
         :acceptlanguage:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sLn4jxsMh8wztcwPBsngLmkKKZSb3KGt5VvNXQqxi9A=;
        b=TSiF3bHQ/9BCMtsRA1TkbQfyOkpxSd1mksIGb7P3TNx96xDqW4KhKRWscF6qptLFAu
         9S6E2/2wWJI6r3EHk7QTIXUu/OryIIrGHGoflcTdrU6hiJHlrh4mCqAxKkOYA1rBUhBM
         xx1W/jcy8gJOGEgLboh4wLwoBs2P9BwrRhGwuMggauG3Hr2zJkjPx5PiFl+jjQR024Hg
         ZUaJj/lmXpG14pXowihDb3zAcrWA6fLtW4EJdsX/SJ/BsKFdhaRDMJp5RnsDfzNWlr5P
         n3z6tvZ9HhbV8WsKIo5ce7Zmk+Wesl/xKw/NVl3XF19E7ygyyvpUThqbuTdqTe9Lf9WT
         cuYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWptkrkTAPHUvWFqpE5p3xpfOSJ0ie1N+TRBcISnCp+rO2wjrJs
	8xX+9EpOKhJ7KDVYFgIMYQg=
X-Google-Smtp-Source: APXvYqzrG4wn+A1OSVYWrwpJjSYDedtELrpWpiawbY7gPP3CfPe+8egd7HAIxh2DdBXO6fkXa2AtAQ==
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr36438981ljj.156.1563780020612;
        Mon, 22 Jul 2019 00:20:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ee0a:: with SMTP id g10ls3051816lfb.13.gmail; Mon, 22
 Jul 2019 00:20:20 -0700 (PDT)
X-Received: by 2002:a19:c1cc:: with SMTP id r195mr30364555lff.95.1563780020199;
        Mon, 22 Jul 2019 00:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563780020; cv=none;
        d=google.com; s=arc-20160816;
        b=uhY6TyFQQmc2YLA8AtXtxIt02UucngH6YZv452JiMNdhaETSzl+0axuNDLVRlSRkW6
         U2N4r8jSr28IeBD71EkqsNQYiyC5Pa6geiV5Kd1xTkp3bALlB6Oyy9EQmU3qIjO2Sf1n
         uowhZsm15mxuVQ1/74y933UOy9iwBz2d4Jqv8juouOiEWpXBrWUXJ3idXaoPNyj5ESTp
         +5qbzIUGx6gLSuwY5NQycecdFjwmZHHghErFTbP/lio5pQ3/MjXmDy/mE6VuEu+FFOk1
         mAVQHv8IqFjsiQ8rTqL9EfdlcuwnRr2nCI7kaFUrgy4fDr3Ehv3p+YId97mRHZbbXG/I
         reAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:acceptlanguage
         :content-language:accept-language:message-id:thread-index
         :thread-topic:subject:date:to:from;
        bh=rVkxhlR9udxxeplAfM9khIN3hF6GDvx/fhGWezngHv8=;
        b=O1ytRqVd2euql5LdcbhydskaxI0OG8n16NGPZFL8jJkSQt2EjbFROKyip/sTOH6AnV
         B/t8pimdx0qAUgpPtaxrD6LmC0a+xXma9ovIjz97gHXEQSPx53zxB5wiqz14RSTLlfWz
         8X2FenwBzGuemwrXxXNQGvm1OUZ4gkLlp1BbnwkKJtlKzznDrn7oIew7gNdbLeD63OOF
         aO/Kg6NyhtfIDyPBVEKMqpA239f6dbxJbaDcAIseC6AcvFW9hQm2n/cli1GhsfF1pUOB
         8vYfV+KE8NVX/5EFm41ouqfINhDr5y7KuUCSzjoB2FZHcd9xjL7wPhtuIsE8YNuWXaKp
         DmDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
Received: from mail3.emtrion.de (mail3.emtrion.de. [80.150.99.69])
        by gmr-mx.google.com with ESMTPS id v29si1984474lfq.2.2019.07.22.00.20.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 00:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) client-ip=80.150.99.69;
Received: from BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0]) by
 BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0%10]) with mapi; Mon, 22
 Jul 2019 09:20:04 +0200
From: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
To: JailhouseMailingListe <jailhouse-dev@googlegroups.com>
Date: Mon, 22 Jul 2019 09:19:50 +0200
Subject: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Topic: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Index: AdVAXdm7WitNXvDORJej8k5qfbWjOA==
Message-ID: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
Accept-Language: de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-24784.003
x-tm-as-result: No--4.876400-8.000000-31
x-tm-as-matchedid: 150653-700225-703140-701090-703503-702345-703655-780022-7
	05220-704949-705161-703017-700950-704053-700759-704074-704714-704131-705212
	-705154-148004-148133-42000-42003-63
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: jan.vonwiarda@emtrion.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as
 permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
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

Hi all,

we implemented support for Jailhouse 32 bit inmates running on 64-bit Jailh=
ouse on the i.MX 8M Mini and it works fine, GIC demo runs without problems.=
 Now I have one problem, that just occurred. I'm trying to get the ivshmem =
demo running in 32 bit and it does work until it comes to the line

asm volatile("wfi" : : : "memory");

When I give the inmate CPUs 1-3 in 32 bit mode and the inmate accesses this=
 line, the 64 bit inmate CPU 0 crashes. If I comment this line out

//asm volatile("wfi" : : : "memory");

both 64 bit root cell and 32 bit inmate run just fine. Now apparently the 6=
4 bit Jailhouse Hypervisor has a problem with WFI beeing executed by a 32 b=
it inmate, as with a 64 bit inmate there is no problem. Is there an explana=
tion for this behaviour? I guess I will now have to handle the WFI exceptio=
n. How do I know the inmate is exiting because of a WFI, all exits I see ar=
e these:

#define ESR_EC_SMC64			0x17
#define ESR_EC_SYS64			0x18
#define ESR_EC_DABT_LOW			0x24

In the ARMv8 manual it says, ESR_EL2 has an EC =3D=3D 0b000001, that traps =
WFI and WFE and there is a define

#define  HSR_EC_WFI		0x01

but it's not used and it's for AArch32 only. Now I wonder, what's the best =
way to handle this?

Best regards,
Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4%40BMK019S01.emtrio=
n.local.
