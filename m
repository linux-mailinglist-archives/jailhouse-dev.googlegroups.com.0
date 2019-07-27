Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBG7C57UQKGQEXZNW6HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0457774A
	for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Jul 2019 08:37:15 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id i2sf26819995wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 23:37:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564209435; cv=pass;
        d=google.com; s=arc-20160816;
        b=Aplf0b/OsES35WWeSsRH1a1Tmdn74+YRJW0HAcUqQHHAfrit082Ron6RfEcaIYBf4V
         jEDzIuOMdKCw94jWUCtJECVmRM5s3P6OdnLOzb4R9W731KbZVsIBlXhedIeugb0aY2u8
         p9hL+gWT54u/wtuACZZR/PWMGmxwmnMgfjMTyfjV0PTV8jDAWg/NcJKKgB1YIlltGTY5
         Q3TPQxLAxYNeZF6Hq1nbzEpwtasMKCySyJHuxP782/xrJns4DxTLPVjIVXZlmpegQupJ
         5bPYC+urs3dmllphAKm85cARHYVIssOLhVhweV+8UVfnBB4gxN/cYBBElxf5dXELCA8S
         nvRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+KV56IY92EZMODJJXF1TYi9z0nQ/XRz+NDqmqjkvUQs=;
        b=Rd50sIqbq8fza21aU0ieXW3/jRrC/diRb09iMC7h51qsWJyJww6C+5P5bKX7eGGFkn
         bJrEuQns4ITSSinDdA5wzdK5wEz+4ubGu1Fwatd59V6m/aa+VO5hSWbL1FK6Njzr4LGO
         swAoJkwlYbc5T1G9zBcFIWXfL1+HxRwla6ycbW4+PtrGeY4yrcLZFv/PutOdWA/TgZGo
         MJ1OByymNlUHkPkd+dlUG3k8WvUP7Gcn5iCQayIGhJ4854T82DvdRPeBbdX4NbmwHEvZ
         xkppzcs9z6bcXiBzpYp++oDE0NCB9GLXh8e+M9AX5j+G70CrfeHfITbIKWCRDPNxHEE0
         XBCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=V9C1mBzq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+KV56IY92EZMODJJXF1TYi9z0nQ/XRz+NDqmqjkvUQs=;
        b=eP0HFFcp4RzysXxa1Ja5GHx7F6EwzS9v4zPjbY5ixRkddLTm1gkvxMyc2Cs3imHqLx
         5CjB3tINlL0xHH9PtPRYm0GN3rXS4D5e6cFRUNINJgSJKeS3hN1LJDf9VXIM+tBSnmgu
         H9iMYyWow67xsEdmYsWLkMoDPlOzvJdHZgUKRFxO7Vb2exqQdrqYEggdEkjAYPymvtUQ
         WrVGc3dA2g9EvZvxh5jwP93/jmIQUCUW44cT6HHNxTnkuOu5BHCFyPdaGNv8Sa9e/oBa
         61rxTmpNKEzPVIahPer8930KQ3uWn1fktB24ndI7ZygKyZkJSxLgE4Vl1CUEZP7IJB3u
         pJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+KV56IY92EZMODJJXF1TYi9z0nQ/XRz+NDqmqjkvUQs=;
        b=jKdh2qwmAhA15vIylwsVIMXFm76CIeTFHCzzk1dWXKSqpEBMflq/37y+ayNyhGMYS3
         kCSCaRZ4OVjAHF8pf1xTiHxhEEQVgyA/oEPTP9VJJW2p4riRO5D3YGDWZ6IQLdNQWXAs
         6BT7qTt5wdCWVS8I3bg0jBRI/+783tNvMKPeFUqZzPb1J5vJL9T5NA8ofkv6wgJBH4vB
         wkmgFwJR12Mp9/SynFWorRjVWEvhIF1pTw862EIBYBQPVO/Dfb8Uom6218ST0BWPjk3J
         aAEAik6xJRMBf0dZY2QYJpkgNyLtZ0KTdqvNLl3iPm2P/fLyaHLnJE1N9LYsEj7P/UK6
         fo+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxw5qPQhX9ds6vjqMDnm5Ir2aJFdLgdo7Dp/Qu95Y7/QamvXap
	BqulpGwPzwTOiaJqgd0SKls=
X-Google-Smtp-Source: APXvYqzjM92KHgO0chczj0ITyCRF2SnPsJR1eu1jTtCEA57YrSyyVzrKj8buei4qp4TUoNy/s1n+vw==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr104788725wrp.101.1564209435516;
        Fri, 26 Jul 2019 23:37:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:96cf:: with SMTP id y198ls19505352wmd.5.canary-gmail;
 Fri, 26 Jul 2019 23:37:15 -0700 (PDT)
X-Received: by 2002:a7b:c398:: with SMTP id s24mr89908082wmj.53.1564209435012;
        Fri, 26 Jul 2019 23:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564209435; cv=none;
        d=google.com; s=arc-20160816;
        b=wtgbdYY28obRvGpcE8ElWMS3G5DD/pe6xnQFNxtna9sRyz97K9wzritVaBIwvsRYPW
         ZolylSCR5KWjg0DVXHTTp01sW8zhk/Qk/W2GqC2hr2oHWbFu7po7Vb1kDEYDL2WFdFqd
         x6JFJF0FZ6D5hdG3p121PnQy0rUVyq7QoIPM6QtzgPWbB3nmBwkVuOxDoSVjSlHOzUk9
         XmPTwlsf5tsWn6MmfAkvn2/pkeTkeG0IL6Jgp9XUyzJciwMKwDLpYbAKAhILIYbDyT2W
         jeJTy3ZK3VdUo+HNuUlh3bGIT2jEjdeGXHGOtfrr8xjtb3tN0yNh51BId1U/JtOlmC0G
         XL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=xzOjdPHM63SzH+2/GEaeJANfJ8Xjt/ecpvMfVlJkYcs=;
        b=hhAUqYA/zkIfGlZp5R6gID85X58rKx0qsdDhD0VG514eKPTJX/tlTC9UxQn1f0yFFn
         +Vwrmg3yzWdU5VMuoC2t1HkURxbgdz6Me5uqj4r4OIZWYIS3IRr9ry2EOTUcf0U8tLT8
         XHdfhgF5kQdrWvlJkwjZxRZnNdwicRngZU+WjSh9K12Q3lHbBmYwvFRFh6hHB/zz7ZMO
         vJR1+C6dzHNv/8ggHrb6+vg3x2k6HHnHSfBPThc3u/NrVGm9Vg6klNKjX7trRRRk84o0
         x9sDleyDkuDcxac7/i3GGIE9v5d08PqOzZojRpEysHEuLPWFYhLW7sjXZHpGCG8KZpey
         U1kg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=V9C1mBzq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id p4si1412711wme.2.2019.07.26.23.37.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 23:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lopa3-1iItIw40uh-00griu; Sat, 27
 Jul 2019 08:37:14 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
 <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
 <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
 <421d16ea-f517-a1f0-750d-65b9f856d1e6@siemens.com>
 <942a4151-1921-4bd2-ad02-c9a98411ac36@googlegroups.com>
 <d3462382-811e-62dd-bd1f-cd39a1b41948@siemens.com>
 <ce8d5010-9396-446b-821f-306272fa9e7d@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <bb9c1a7c-581c-1696-9151-490d0817294e@web.de>
Date: Sat, 27 Jul 2019 08:37:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <ce8d5010-9396-446b-821f-306272fa9e7d@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1C09XlRjEFFJKOf3L8rmKfkiNEcqI6lmu6cbdL1eLk6hvaDxbHA
 Y1TG2OFmxIW6Lzx7VQI0B+MM0rOLd2PHjOao3sl3zjG9BI9OwhXr6EkyXOC9Bcv4n903pIE
 GCAz0IqvEj8KXk2URhAXWQPh93d0TTxDw33DKqQJnJiRb3H8kgG5IQYJiv1o2m0rFBBbRgI
 PL6bSS3/u4qTr7k0KoXag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uZRzmLO7DVc=:n4EukJvWnV8GRIycw94bJw
 W97ZzHNV6sJ/ztyAIicaySqTAKpNUzCECACME5ZsiDpMUUJ0MfVWkN5lDRsfOvcYkxeWRZYDH
 973gT8LBstI1v3rmWhOnEoLzvzGC+VY+e4lqq/jR2hyovJgU6xady2P+/IFCg5AxP/ZwpdWOY
 F+WIFVQ4Tajo9b4wUGD/TPLNVbYhHvf3luf9C1k0MsaXe8WoW6Jwgjxviui70x1nC36lfi/V6
 NiKENP2sZi5N9OP4vLKStfAvjCL4Tb4RN/lwZXLb6q69UeqGlWqyNmaLzE26r+rAT3TJSqUGm
 BrKUWhz6hVzal8zDYoc6tcPW+ZowQCjPpH0/mD9A2Ti+TNLVKZUCU1nkVeEyZrTDGHbGLFWkU
 XHS/idqz9cP+PWIC0MCkqEzsp/hmMqcfiPRaPaw3weWe8oNkaj6AjngXS9vjoJwGoJSR5oueV
 m8t6ASB+dUaT+7cgCHdf7Sp4EWICeZTs0JabAapbi4vTOFOdQmU+RIuzkZ+QD8d1/kQ5jLEgZ
 TEPM6zge64O7XEbrfeWIreEaD8iEMPwNK7gkePXqmvY0/kQHeOrKkV6Sg+D3Z+tjU+LdcfFRw
 5WoLBQPdjMstGvv9n6uDeQEVIQK9kRNQRoGfuH6l0UYWCRUr4KOs5RSovqWVluz2gtWUmF+te
 mx66GdQfi5rRXzmMEY3AJVvDbYhQW82vdylR5YQOulGQ5/FVtlWI0xwDlC8hsq02zdvW7vRFH
 dxUPIqi9xCSfKVkasDWvZGrRcTx28O5GSGrcKbPBP0lEWEI4sUmsez11U/muOhk11woupX/aF
 wCy6BqP3cD7/8yaz/5VTVto3XUzqm1CAdrUAkX2yWp0BKmFhSpyW90taCWVLjNQKEBQhgLfY4
 JVRM3SIFxWYWsbPnZ/OgNR8aRdNmQds5t6dV1VAt9Y2lCGwLddN71b9e8Njf/wnyaDT7cNB0c
 GA3n9wfCMJj/SavR6WVL4c4Q9gbM6/MtRXYxq+p8HDpR4ctDHfahyHN7YJ/T00LoCfppai250
 wWEonoMacoqyVMFdW7lFDRzu30WEjC1D3oqEocamTLTTiuC6xlW2ZNaOiW0j+qRQ04XFmL6uM
 mue+o/iW2u3QtIrsQGUro3llVyEg28R14la
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=V9C1mBzq;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 26.07.19 20:55, Jo=C3=A3o Reis wrote:
> My distro is Ubuntu 16.04.6 LTS

Just checked with ubuntu:xenial (same version, just as docker image), and t=
here
"make install" works fine, "jailhouse cell linux --help" invokes the right
helper because /usr/local/lib/python2.7/dist-packages/ is part of the defau=
lt
search path of python. IOW: Can't reproduce the issue.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bb9c1a7c-581c-1696-9151-490d0817294e%40web.de.
