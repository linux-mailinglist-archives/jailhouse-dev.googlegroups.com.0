Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJUH5DUAKGQESNTEDCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF45BC49
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 14:59:19 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id n26sf1014339lfl.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 05:59:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561985959; cv=pass;
        d=google.com; s=arc-20160816;
        b=X3jsj0VGutCIRDMdr8X61Ti6QFeQbQNkByPua0qksUHPY7Fa8kVTubf4L1hiDCeOr0
         sPSLtR920NRqy5zvevK0rCyHWDQIoC1Ul1sWI+ucpSUnDlFY+lSyz6NuSAcMByPG5ca1
         JA3jlP4W5F8HYQ8G0qOsvvDpgbQRBwtM8WWSP6dfVM/Ni4peDF3A0YckSKozB5Hf8BRE
         dS7HwHhDfbScHpwA+z7z0hWdTOMltB4009n7KCmzqxzpSLg4gO9szdVw/nul7tczD1pd
         U7oS6KwR7vwSYxEaEPojVbf5ZcxYkxkp8OE1Wb84lKv9u5XgEFYg31+quAp3NnF2Wqt9
         9xKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=dl9V6pwQSoW/vlw2KB1ZtRiebtBIgdwfbuXb5/Oyc3A=;
        b=LG3IzOF/z/tScUDFYdopcdAs7NB1ZlKvgvjaVGfGE32PqmZkVu+LyuBh0j8T2b8m5O
         tirkSylyWJPjEaEFUnZnZDdiqLxGW7AJkR7iNJN67WS8KMVp847RhxxRoQpd9xQTWWXk
         69fdTbBT0oybJvopBKMbUAZ2ZP+g9dZNL3DZuDkXDA8Q4bejVY+dNg8Cp+h/WTdwrqYc
         o4LRKolrfAnHNEzg90Yqe+d8K+j55c03mQz3N88Y9m3Xel79FM+lOdAcF7sa3DbQdZLG
         6xyQLKUAZxTQmJ6lcRhaxgxXP41oadgmydsiwStTUCA1llr77kzAsuR2r9cxBUd9uGDn
         JIsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tQeMpCgp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dl9V6pwQSoW/vlw2KB1ZtRiebtBIgdwfbuXb5/Oyc3A=;
        b=ZTWnsyOZI03a7YAEMQpGaT3ZaJyo1kkZDdTAk0umoXkF7KBamEXzoFAjAuSs67bAJ9
         xI0pS7GM06c009HogQ2IB3nc2d3Jp8rr57ngogHLV+N8SGgzgDbo8erszy6FLtnx2uyd
         J0CLuhaGUOYzfqW5R1FjFKSRcd+/zVymEN6TljP/gqaBBDeTcE+nNUdnwL4gH0Qijf3T
         XRI68JwDUwb5FDF3Mbl01L4rNqyFCoCnYXfu2yOj91y/Jg43A5tPvKC9q/QU2KNSHuiG
         AIznktcwhrqcanoYZT/utolwetpJKUL51wvF8itUj8pVP9NOYktirPuBrYcJGHE2b8el
         jUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dl9V6pwQSoW/vlw2KB1ZtRiebtBIgdwfbuXb5/Oyc3A=;
        b=Ic9q3cXG8RcNEcCnFJuF+s/Zw8ITnD5jF5pLHs0bx2r+F2e5xwY3QMlBGxIguMrWnw
         J4caJDgN7MYl8G0CweufFTABpvcU7vnZp4VSMBv/NW00qHY5+6G86fst6LY7fMSZwt3s
         u9ExxrQDDJgbmiDcr/Aeih+5cKBRtwl6+tk3kCkuV91g2q4ttiauY5c8hSF+0XiQ7A3g
         Bon/mHiEV5e5ZUGYnvxpznU4uVU3gPTFvYuqAgzViP8FrcbfQ6x4wFi3SdrF5Ce7iBY3
         nOssNUQls6g9FKVx2WXdNC4lJknGzs/ik33tmku8f53NEIwfXNNOsMiyRKkRQWY54H2W
         Kc7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJ4u86309q+9E0K2gl1CEL3W8isOvSGjmHsG8YQQpdzIEEkrzM
	xPF1IpEtGOu5ry+DH4qWD6M=
X-Google-Smtp-Source: APXvYqyxnr/O4Z5K0USVJc7UUQbccjhZoL84Hkepon+vcBSI91ByZnH9Sf8Tp2AtcQSBK0NFvt9Ifg==
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr14080583ljj.78.1561985959365;
        Mon, 01 Jul 2019 05:59:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9445:: with SMTP id o5ls1119198ljh.9.gmail; Mon, 01 Jul
 2019 05:59:18 -0700 (PDT)
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr14280481ljc.38.1561985958514;
        Mon, 01 Jul 2019 05:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561985958; cv=none;
        d=google.com; s=arc-20160816;
        b=jIsy5kJ/6gDxAlvyLXYrnw/p54llLFeiwDAXxrptSbquSB0xsOqtA1+wHmWvb04UUL
         HYXuWt+ARAc98uR6tht5dGZshzSkqtsxpVLihTkTPAjJLPeQGN++2e1Ewq3e0xN2d0xf
         IxKS5GxH0DYvDWEFthxlG7gBxAj3IxCBj5xFs1AjAZ8Naa3E/wVv71343ggve2OzWKHG
         2cVD0dcdT8Y4HQRTxP/c2xcDd2UY7EainYa/SVcqLvP6EvdF9s0fwNeExvMRvsGVWE5c
         YrysvQ0TOMU6VZ0VorWrxF40WDqkXU/J7YaHtUIusjvY4NW5geWLbQBgYqsu+ZMZK+SZ
         6CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=RS544aMDujioYX+RunFc2B1CNuuI38d7zOvOJS8dPf0=;
        b=WptnKKZVTrlzNyv0lsZBJrcFwBEiPcYIX06ffkYpE+bMTOJuHyyIiHv3figPKhFpeH
         1YL7x7regZQF96CMQKY0gB2eDka9n8j8+4CDclAeb0EhE4RAwZ1Hh2iLBLs01Mg91FaP
         8WQYBxy50QVL+hN09FGHWP/WlJmOH9gtD0sFaAr87nh6nxfimJOVm/POSSIpYaAi9Fzu
         y7dxrbhXA1aUf8SfDJyYMFiBrMkOvAA3LiM0VzyMQcvTL8Y9nuXC88PWdGBJmMwtjAO/
         OnSSOxK/kUTskzdayB/NK57/MBueWtq5x/56YMP6Tc3XzwrAZMmMWY3ElITnHupwtG8t
         HPjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tQeMpCgp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id y25si599442lfh.3.2019.07.01.05.59.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 05:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45cnWT268NzxxP;
	Mon,  1 Jul 2019 14:59:17 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Jul 2019
 14:59:17 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
Date: Mon, 1 Jul 2019 14:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tQeMpCgp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 6/27/19 9:06 AM, Jan Kiszka wrote:
> On 25.06.19 19:25, Ralf Ramsauer wrote:
>> Hi,
>>
>> for the completeness sake: it's about ivshmem-net. The PCI device shows
>> up in the root cell and can be discovered via lspci, but the driver
>> fails while probing with
>>
>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>=20
> The register read-out failed. Maybe a mismatch between driver and
> Jailhouse version: Which revisions are you using on both sides?

siemens/4.19-rt vs. jailhouse/next. Should match.

The bar_mask was copied over from the qemu demo. Other than that, the
only thing that changed is the bdf. We simply chose a free one on our
system.

The memory region behin ivshmem is high memory above 32-bit. I
instrumented and checked the code, but that shouldn't be a problem.


Thanks
  Ralf

>=20
> Jan
>=20
>> [17061.426193] ivshmem-net: probe of 0000:00:01.0 failed with error -22
>>
>> AFAICT, the device is correctly set up in the system configuration.
>>
>> Thanks
>> =C2=A0=C2=A0 Ralf
>>
>>
>> On 6/25/19 6:07 PM, Mario Mintel wrote:
>>> Hello,
>>>
>>>
>>> I want to set up a shared PCI device in the root cell but got stuck in
>>> the process.
>>>
>>>
>>> I did the following:
>>>
>>> I=C2=A0reserved a memory region for IVSHMEM and referenced this region =
in the
>>> pci_devices.
>>>
>>> When checking lspci the device shows up but looking at the dmesg=C2=A0t=
he
>>> probing of the driver failed.
>>>
>>>
>>> I attached the configuration used, lspci of the device and the dmesg.
>>>
>>>
>>> I hope you can help me what's going wrong here.
>>>
>>>
>>> Thanks,
>>>
>>> Mario
>>>
>>> --=C2=A0
>>> You received this message because you are subscribed to the Google
>>> Groups "Jailhouse" group.
>>> To unsubscribe from this group and stop receiving emails from it, send
>>> an email to jailhouse-dev+unsubscribe@googlegroups.com
>>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>>> To view this discussion on the web visit
>>> https://groups.google.com/d/msgid/jailhouse-dev/525b5e1b82474f3eaaecf83=
b150aa9f7%40st.oth-regensburg.de
>>>
>>> <https://groups.google.com/d/msgid/jailhouse-dev/525b5e1b82474f3eaaecf8=
3b150aa9f7%40st.oth-regensburg.de?utm_medium=3Demail&utm_source=3Dfooter>.
>>>
>>> For more options, visit https://groups.google.com/d/optout.
>>
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6a5c3bbf-ea93-775a-edaa-1dda25b08d8f%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
