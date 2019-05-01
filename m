Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB76SU7TAKGQENMMABSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D610CDA
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 May 2019 20:46:23 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id n6sf18599493wre.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 May 2019 11:46:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556736383; cv=pass;
        d=google.com; s=arc-20160816;
        b=uGscC3tDxyTrgsTeII8UDGdW0w8hJGTiMWTMM4VXTcH4AG3sxr1fIhYbJGATUOGrS3
         TEJn8c3pZ+gtCxSa0BrYNYDk7JxzUPMweMhpLyvySwslU44xxnqVxkcuzz32oY/m2NgH
         ZHZtnn+v1CujYjxFDcHX2YuZQDTL6BYOUC8x1JPjoJP1OZ9fDtohTxCcB67U94LoYZPc
         4R1Q6UaX+170ribw2qarx/xq55YMN3KsSjYVyyA5iOMvPWmaONE+VJQ1aOqViT1puJt9
         5LJ8jkA6oKdE8xyNBxmGtN8tKsosBBeMSZAmvvDwp7CStnSpxgwxpWrS5aStFSW++Jlx
         C8yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=IIe+ciqQ7E7OKfpzN74ivS5k90O2ec90mpjx8kk9K48=;
        b=nSHcRPeB7bCsreP0TCc116Bd3TfoOOTy4qNhvIYiOtpXxuQFhi0XbMszqL3okzt87e
         RqaPB653TiTXsuWAoasirPJuybo4FEbsccSKQkVnsCc7q02YGRL9CJghxaMbATd8MGhG
         S1STD1zApk1XUBw+tPgvL8SC0GewDOme1JYFIri67P3fDZMoru57jPB6s9khniWCdgZO
         qxFN+YPELG6mI7ZQKbsFtdTGRin5sOQhVxRMqQ9WqKrsaCR/MxBiRpH6dL7vEsIVgCrG
         d1QV3Cp1zh8lB1xkoh8Z/j5xFgjiPVhYR9csjpOjV370x2Fv4Lhp0PN7GoXePjU8E2jc
         Of3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Uk60u0SI;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IIe+ciqQ7E7OKfpzN74ivS5k90O2ec90mpjx8kk9K48=;
        b=WSXKeLa8QDhWSoO8HGjxAceEUvcEFb7SgrflEdI9UR5NJsTfFwjjB8QlPeF6YU3CdO
         sdmJrQ2mfIJTwmXpngnW2jUC2OZbD2rc5C6f4PxFL53SI2GAPtc3dX9f6JBQ600gyi+C
         KUKg9T3cebngSGnXbhPqUaFdWZZIdWmtuOSCSYHbwf0BeVy0Okf15alDPRDLWxwgqRQZ
         I8ahjObgypS0b4ktqLcS6JL9YSxhn5aABgYciI8hJa/Ty4CAePjc5Ye/fDUkZ2hpxLT2
         qs4YkRDcLGls7cAXq+hFT1goNcMytFeJTAh52FjfpmtElLKdcamJWzT5/Mfous0Pe6bR
         rJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IIe+ciqQ7E7OKfpzN74ivS5k90O2ec90mpjx8kk9K48=;
        b=te3MeKOS/iHcELp7LQi4vnV7pbDAY/eDA0ytw7CyYL59cVihEb29NQkJX5nEvmnQ4+
         fSKpkCOerc+jW4RxJnRIZbFsDvlsW6AetZIjiabyu5I6m8XVwwkGwXk8q9Hsr/3q6qlk
         gBvp/muH94vP8gncKxoLQ3vTpTLg4h5o2ccwlKYcif/IAFulF23vGPs8dvLvP7LoeV2F
         bWlMpvqpye/sCzjJkbW0TT7uycIsnB/gBFx1WD7kruYHzLHkuvw8wiivd6NA/+bXMlVO
         qWW63Sk/uArwPBa9gHb01ykc81w2UYBA35nJmgLNT+s0TmmKuRzp6a1sZDeNpqZmcci7
         zucg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVtqFXZhheYFqvXNno/pTc0LfZ+qKA62uG/TPCyffLrJ2cv5GQH
	cz5tA1AADOv7KWVuSFZKRRA=
X-Google-Smtp-Source: APXvYqyL1eYSCljQdkVBxlCt7LsMvfyjaqw59aeDwGQJhu63y9Rmi7QhttRR3nzrIVU+nPZYKXhlRQ==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr7912873wmf.5.1556736383397;
        Wed, 01 May 2019 11:46:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:53cb:: with SMTP id a11ls9179467wrw.0.gmail; Wed, 01 May
 2019 11:46:22 -0700 (PDT)
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr4248973wrt.191.1556736382775;
        Wed, 01 May 2019 11:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556736382; cv=none;
        d=google.com; s=arc-20160816;
        b=u6liw11LCZFEGP6ABulk9miDF5njLNZUyW+BkJ3Q23xIRCW8YMQRN7WXCr9W1u8s+r
         PmmZNAjrxJTwWwa+7x2WyAiZmWB+JbrKHg6s2EsM99cRpHERcg34bi2dbVgc63bdz0Ok
         KBxSNQSs0JIKShheWfSncShu6e8NEpfZoTruHtK2GeMfuSEP3PbJ6eI4PqSdOW10sGon
         bKsQqjBnsIDOB3DAI3lFy3gVguXdoYcSUliMiTZDW761gGjmVxEIgYxrr99nCFSo2uhT
         LtYL5hg13kYo128woYNVZkAEFVvqI9iap/mGrHjNkUz6rzWPOMwXotL3Jf8ZCi9QuzHc
         0r6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=yK2J5+53qV3SGi5p11/xvfTKqhPeVKI7b4VyS4TK7P4=;
        b=wc5XEx0qhHXTaBHoVl0Qa6oiGbzr6XRYtRoLPspQfwdmJ0tyaabwAKbXiGoH4zA5JO
         5tnYq+7lHnyIK0Zf8gGDk4l/9yg36FeOEeh9Y9dQKMAPigqFMgBvQsGDqZuyuhHgy+29
         VqtxKoqxSEcV64Hs//P2odp2UQi9AwM4BtfEgKOoaEvt/Swfb61zscJaXRBaNDPFnqP4
         yjdSMoi544kR9LBc59BZmtiTg40nbeHpo+Cdk820KVyJdVLxMrYS4HS/SnSFQX+C9nKK
         NHgKtKNcRYgkZZpEPVfQiB/015f3gjgEPbtIyZ/EnokVZCruvZjCD/sjxCcz5AZvbl4S
         4JOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Uk60u0SI;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id u2si310406wri.2.2019.05.01.11.46.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 11:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.159] ([95.157.57.47]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LzVMw-1gidaO0Khu-014oPb; Wed, 01
 May 2019 20:46:22 +0200
Subject: Re: Running on AMD Ryzen
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>
Cc: Henning Schild <henning.schild@siemens.com>,
 jailhouse-dev@googlegroups.com
References: <659b46e1-2852-ebb7-9bdb-74d057aa44d4@st.oth-regensburg.de>
 <a0b17fc8-50ad-efae-6505-96c2d8c3aa32@web.de>
 <7fc9b026-822e-3880-a50c-fafd106d3b00@oth-regensburg.de>
 <aed89b6a-35ca-7d4d-3960-597573abee4d@web.de>
 <ccdbf632-e17f-af7d-d523-92ac0be886b2@oth-regensburg.de>
 <20190327175044.46604e0d@md1za8fc.ad001.siemens.net>
 <aedf806e-0b9a-9599-b2c8-d1e2b6aed876@st.oth-regensburg.de>
 <b00bb829-c6f9-ace5-d94c-095155af9909@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <ee9391ca-89d9-1da2-da97-23d15e9486af@web.de>
Date: Wed, 1 May 2019 20:46:21 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <b00bb829-c6f9-ace5-d94c-095155af9909@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:oY4jgDLPkOZbe3TIJOs2oPk+nbjR/43ix2bC0O5DHQapNEdglPB
 lesJ2VcAgUTDQYyNZ6JTj08sQgjbquF+FiMWmvPE52dMQ8gXsATsKCkTx6iKItiKF6UtQsH
 9mSgYmfBte/EPhGQdXAOJil6gOGljn1UnZ0fIzyChAay40tC0bWCRiHIayhC9pwN9iKO2eZ
 hgLbB6Cfkz8b40P8Rex+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9I77ZwoGh3w=:Bws4jnsoePAyfRInItXVTP
 QJiBf4HJlpXfRirF4/CqOb9J8mYPW5WBe6/Whm2gklVYXMFO+tlM9qcZbdNhC1S3tRIDK9Sf6
 X4rv6/R2R/mH745BrTIq9TEN7RmRqMB65NBGY5hQGkhmCCroJZr1bKSaRvbQkE9j8hXalhFUU
 t3hvRenG9E//39tcuuYgSCokXuH8bi5l4MlSIuWlmljWYXaFsUR7TEKfVVWOXrSX0vCwsm/iX
 7EmSmyITV8W8UbEO57cM0lOjt/mwJIAfho1yoWLZOk9+zx+8o35RA5mw1qcDT2FymXQRSSGTB
 uMdu4RLXX5UaaeViZjwxzOzD7BRLpwQm6yftwMALRnWqBZ1aKPvPDCa68o6PuK09pY5KUsJKC
 VkP2mt+8aFbt7y9qg75be4A0b2aNMUVq84XVNSW1c2iDca+iMfIlIp6YRDxqI6K7tYNDnMmq1
 D5XCjuf83d0fYrpaMIfdNwBRgvYu1TFvRBPtYYKenpcqaf4aLJWCWtOzL9BA6JcDj1groycBo
 XblJdDqPG4fitU0hyZsZoX2WDfrQBwtu2XXXnJNsdEL6ti5zjCd6id7hMY2LnVkG6t/fp3jbW
 6bNOktiTHcJdCGouLwXjp32oJ2PgNJ78yqj25QxH2ZePTA3scROoulhoIDkaXI5rnWmO2If9c
 xMDNnXki3RygEFOgBCwlOsBB+fXp2KGzaoy0mMWocCjf57lfEZgYWbf5dn83K3TuRL4qogCff
 33Gq46vqSEcUWoLv9I8r63J4IKH80GzBy0c6iT0azsMfcCOWhX35THQOHNTt60vAeMzaYdRp+
 ZXiUmCBy7hdleulbRmtMQBhFDXvaUFUxt0DdkTpA7puCMt8qqY/e+EB9JlRnUMOFt90URXJtp
 r3uPMywSh5Wp4raYBXAjbPDfnU5N8No8PPlbRP98Va5lb/SonaKes9jjgn8yHJfDYbMau4vgC
 ja1ARRkwdwg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Uk60u0SI;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 29.04.19 19:01, Ralf Ramsauer wrote:
> Hi,
>
> the issues described in "JAILHOUSE hangs with exception when trying to
> enable the root cell" sound similar to what we experience on our AMD
> machine. Unfortunately, patches on latest next won't help.

Yeah, AMD has no VT-d interrupt remapping, thus was not affected by this
particular issue.

>
> In the meanwhile, we found out that we can revive 'lost' PCI devices if
> we remove broken PCI devices and rescan the whole PCI bus (IOW,
> reinitialise the whole device).
>
> While removing PCI devices works smoothly while jailhouse is enabled,
> rescanning the whole bus will lead to crashes (basically the same issue
> that Hakki described).
>
> During the rescan, there were some patterns of errors that occured:
>
> a) PIO access to 0xcfc for several devices (always address 0x74), like:
> FATAL: Invalid PCI config write, port: cfc, size 2, address port: 80000b74
>
> b) MMIO PCI MMCONFIG writes for several devices (always reg 110), like:
> FATAL: Invalid PCI MMCONFIG write, device 03:00.0, reg: 110, size: 4
>
> c) For an rtl ethernet card, we had some:
> FATAL: Invalid PCI MMCONFIG write, device 03:00.0, reg: 70f, size: 1
> which doesn't fit to any capability entry.
>
> For each error, we added the WRITE flag to the corresponding capability.
> In some cases, we also had to expand the .len field.
>
> So this makes things kind of working for us at the moment, though I have
> no clue what I actually did. :-) I need to learn how PCI works to get a
> better understanding.
>
> Anyway, this raises some questions:
>    - Why is rescanning the PCI bus dangerous?

As long as the guest does not try to move resources around (reconfigure BARs) or
fiddle with device capabilities that may have side effects beyond the target
device, it's not dangerous.

>    - Did we maybe allow some access that shouldn't be permitted?

Likely.

>    - Why didn't the config generator find the right flags/lengths for
>      those caps?

It didn't try to. Unknown caps are not considered harmless, thus we neither
parse their lenghts nor permit access. Some among them might be fine, and I'm
always happy to take patches that add them after thorough analysis.

>
> Last but not least:
>    - There's still something odd when enabling jailhouse, as we loose
>      those devices, and the symptoms are related to those of Hakki. Do
>      you see some overlap here?
>
>      Maybe the issue that we face is not specific to AMD.

The pattern you describe clearly fall into the same category: stuck interrupts
after handover. So let's pick one device and look into details:

  - what is the interrupt mode during handover (/proc/interrupts,
    please)?
  - if it's MSI or INTx edge: does the interrupt see a single event after
    handover (artificial injection by Jailhouse)?
  - if it's MSI-X, maybe doing that injection we do for MSI helps?
  - it it's INTx level, we should check the interrupt status (some
    device-specific register, maybe also PCI status config reg, INTx bit)
    before and after the handover from Linux perspective

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
