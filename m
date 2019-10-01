Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBGP2ZXWAKGQEEV64YRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC9C3A55
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 18:21:46 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id a15sf6268203wrq.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 09:21:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569946906; cv=pass;
        d=google.com; s=arc-20160816;
        b=NG1+3LjlnAL+ebqv/r7qJ4EQnEBhT24382cHA8jPJbgtQHp2EMm3fdwHEazPkeQoGQ
         iLl2VrHoarPIbQUmpP/1hjpZQstWfpP2fIa0AAKjrP6vVNwVFJMl/iyodcKy1yNfHDOA
         JYvMweZIlRf3u/7P7s52SoscRnQHCrq0u5mZpkbf5c5Do353DHIq6dYApEAeY6eeXGdL
         wanSwN2rXtz4qIie+ltET01HP8YL3tqowYi7FfiO4WJrjnR0Ep00iXTstNOHdIrOv/MV
         nVdqRWvjlf8y4v/v4rnxqBKAfMANcc1KYjhNZJ6EtI5+hA7nUFojhLx8MzV31XOt8UVk
         H07w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=amWT7PmfqYtlCEbMJIbkLiPO0PZLDNywoKJFuJYQyW0=;
        b=eT6U1DsoYinydQM37fSS+iH7ZBw5SJr8DEJnXjPRMzuhLPA3DRTg2e6E+gBZFc9W/P
         BuJ73/A+5D+UWl68nGz2k9Spfe1OK0QZ/WnpyhxVqldmdDCkVPJSkciA2DzcaFYnMC/j
         ePZEwAUAx9v2sN7r4eZts9U2/EROzyrhtxe1erRxSp3JFBPlVtuTJ1P4vOs4rf8/mne4
         /gwUig+BICvb/ZBo9VQWfg3aRCbfCRgdCnbCq4A5Y/DtYyOGz0E33mtrSuSP2EGAbBhn
         ziLYwJnAPkz7CaPtYceSpPC2v/vbh2LeDew+ahskt8HR3RhaBaa5nHOLib3JDK721UIQ
         cAaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=U1qkog8I;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=amWT7PmfqYtlCEbMJIbkLiPO0PZLDNywoKJFuJYQyW0=;
        b=KWmWVPJH9u2dzeoQUYmMCPXuQPvUTxZUCTaFA5xVC8KBb22x4/0+cY0oaWf+JpNiwF
         RSfZmr7rMomqwb8krk+eS137+5DDPaUvcC3A+gEhuIsQzhraQ62MfRCwdd5JOup1F0tI
         OFcUJsS0xm0a8gwJQ2lW57+ZLQ7G48ZAF51jTAkzu2VYjt18UZ/bndGaYf6mEZPKKHZR
         p5YU3nsH2cpHtCc7W1/eGrv0bVerLthc0+9KYVkPrIF4OrxTaxj2kgSemQgXzbyjupKo
         cF9z+Dn9OgJDbM0ah2qoJWNuuQwXef91YvITpeJdAGTS1PpJOmqoopIXHOkCn5NCgrNq
         SYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=amWT7PmfqYtlCEbMJIbkLiPO0PZLDNywoKJFuJYQyW0=;
        b=kKv9GoeUZJx9YzA1ifa3FK2YTdxyHT+eITRbMNvZx3e89kqkU3EgdWouoTPvsA2zJn
         hshG1JQ9E+CdDxm2Y67JcE7gIGq1EF7ziUsg1je/2w58CKTV5PeYAPxMzZDBjeW8xgPB
         GeNfbNhQhMPlimzPkRChrQXUg+NxoCBD75dfJG9wG3zBWplJ3aanAOW9gAyAUssBXudk
         zfpRCQDlL23/IN6Y7zDwVKKsdshsODJGr2nLnpgkNirrBSrwhYy2kyYPRHJlMs4ZzZ+7
         UVXhaMe9DYG73ZtuAQl2WEn0LsdRNicCzqlLn859ua078wDCwmPbVv19H+oj3AWr6zsP
         kizQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU90hACUKOP2sJnEuq+ootHVJbrqBZ36w5NFLLyxMjnDdfZdNUd
	URGuRgRkZy5w7wREnth6yE0=
X-Google-Smtp-Source: APXvYqw/ll0p7QEP5WoZo+0mS0RpYoQeXkPlZ11FuBgB2ylZ6ZUBZP+BbNFqMQJXb6LxNNcf7N7Ubg==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr4313659wmk.11.1569946905857;
        Tue, 01 Oct 2019 09:21:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8bce:: with SMTP id w14ls4403519wra.11.gmail; Tue, 01
 Oct 2019 09:21:45 -0700 (PDT)
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr1671195wru.329.1569946905314;
        Tue, 01 Oct 2019 09:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569946905; cv=none;
        d=google.com; s=arc-20160816;
        b=xJgnejqqN9cq5sXLNdi6qJ1qNZXhC3sXDU/9fJA28l7IiwmSfmLL6ZAoBfMOfZJpc5
         kWNIcdSSbjdWvAY/0lfiQbKUs5qEMTZx7SDQ1rjW4z7wbiYPTa48kVrzLkqhsHCc3xqG
         iSPMCo30BiALia73jeLktABixlr/sOAA624kC0tLHXWkuzoKUIw2MINrlQV5WcHcJXSQ
         vTddc/0GGvsCTacDpv4ms7XnBvloPUmCQYOf2BCsJdYPU75SpF6pK6iPd518yNcJwrBI
         3kgkyn6Zfs7ozMKyMqSnZDky7TTq9A5HVb/Wh5Y5wsazVK3901M/wnS7zGhBt3IL+Xz2
         WA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=fj0QohbczZWG1N5vHZA9ZzNydV6ZY5DRYJGQHUOw/RY=;
        b=ac9m5Ka4Jd2Vq6pvxRR+3HswNWhiUJ42hgL6/mkFcKR7fi6jFrcZ/ebvx8NbVPUghx
         7ZQ+5GDepkVBKuaPMV8R7qDsTX50Iwodh1y5/iCBMJvcCvbtkGl6VsfnkUxIv73fXdKl
         fbiB4nAJhhY1OXB+C7ODtY9wZXD3HPblMof/NbcI1SMJNEq2DR4yUJ+mApW4Tdd9HuZd
         IEt1NqkasdsO74SECKsDu2Sp3mom6rM/dn+Q6mZJy0Wt9OCRSo96WrG5qwPI50Hwvca4
         YpCmYTCUsxHkyHs1Nv5m3zpCDE9Ywm6MhLJGsmLvm4aFueL8DPZfgw6IDcbrsFv4coKs
         4vxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=U1qkog8I;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r1si911568wrn.2.2019.10.01.09.21.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 09:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46jPfd07vFzxxM
	for <jailhouse-dev@googlegroups.com>; Tue,  1 Oct 2019 18:21:45 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 1 Oct 2019
 18:21:44 +0200
Subject: Re: [PATCH v3 14/14] pyjailhouse: x86: implement pio_regions
 generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190930193953.3002-1-andrej.utz@st.oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <d51bd3ed-a3dc-59da-b2db-2b4845d7cae6@oth-regensburg.de>
Date: Tue, 1 Oct 2019 18:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930193953.3002-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=U1qkog8I;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 9/30/19 9:39 PM, Andrej Utz wrote:
> This replaces the old static port list with actual port regions from
> '/proc/ioports'. The static regions from said list are kept and override
> the data in case of region overlap to retain compability.
> The generated port list is virtually identicall to the old one but eases
> manual configuration.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py   | 60 +++++++++++++++++++++++++++++++++++
>  tools/jailhouse-config-create | 15 ++-------
>  tools/root-cell-config.c.tmpl | 11 +++----
>  3 files changed, 66 insertions(+), 20 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 0dcc7475..baed6a40 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -147,6 +147,43 @@ def parse_iomem(pcidevices):
>      return ret, dmar_regions
>  
>  
> +def parse_ioports():
> +    tree = IORegionTree.parse_io_file('/proc/ioports', PortRegion)
> +
> +    pm_timer_base = tree.find_regions_by_name('ACPI PM_TMR')
> +    if len(pm_timer_base) != 1:
> +        raise RuntimeError('Found %u entries for ACPI PM_TMR (expected 1)' %
> +                           len(pm_timer_base))
> +    pm_timer_base = pm_timer_base[0].start
> +
> +    leaves = tree.get_leaves()
> +
> +    # Never expose PCI config space ports to the user
> +    leaves = list(filter(lambda p: p.start != 0xcf8, leaves))
> +
> +    static_regions = [PortRegion(0xd00, 0xffff, 'HACK: PCI bus', True),
> +                      PortRegion(0x3b0, 0x3df, 'VGA', True)]

Looks like we can remove the static VGA port region from the parser. If
VGA ports are present, they will show up in /proc/ioports (as it is the
case in qemu for example).

> +
> +    leaves += static_regions
> +
> +    permitted = [
> +        0x40,   # PIT
> +        0x60,   # keyboard
> +        0x61,   # HACK: NMI status/control
> +        0x64,   # I8042
> +        0x70,   # RTC
> +        0x3b0,  # VGA

And in addition to that, VGA doesn't necessarily have to start at 0x3b0
(look at qemu).

So all we have to do to deal with VGA is to search for regions with a
typestr that contains 'vga' and permit it.

  Ralf

> +    ]
> +
> +    for r in leaves:
> +        if r.start in permitted:
> +            r.permit = True
> +
> +    leaves.sort(key=lambda r: r.start)
> +
> +    return leaves, pm_timer_base
> +
> +
>  def parse_pcidevices():
>      int_src_cnt = 0
>      devices = []
> @@ -829,6 +866,18 @@ class MemRegion(IORegion):
>          return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
>  
>  
> +class PortRegion(IORegion):
> +    def __init__(self, start, stop, typestr, permit=False):
> +        super(PortRegion, self).__init__(start, stop, typestr)
> +        self.permit = permit
> +
> +    def __str__(self):
> +        return self.typestr
> +
> +    def size(self):
> +        return super(PortRegion, self).size() + 1
> +
> +
>  class IOAPIC:
>      def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
>          self.id = id
> @@ -852,6 +901,17 @@ class IORegionTree:
>          self.parent = None
>          self.children = []
>  
> +    def get_leaves(self):
> +        leaves = []
> +
> +        if len(self.children):
> +            for child in self.children:
> +                leaves.extend(child.get_leaves())
> +        elif self.region is not None:
> +            leaves.append(self.region)
> +
> +        return leaves
> +
>      # find specific regions in tree
>      def find_regions_by_name(self, name):
>          regions = []
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index cfa7fbad..e1888ea6 100755
> --- a/tools/jailhouse-config-create
> +++ b/tools/jailhouse-config-create
> @@ -162,18 +162,6 @@ def count_cpus():
>              count += 1
>      return count
>  
> -
> -def parse_ioports():
> -    pm_timer_base = None
> -    f = sysfs_parser.input_open('/proc/ioports')
> -    for line in f:
> -        if line.endswith('ACPI PM_TMR\n'):
> -            pm_timer_base = int(line.split('-')[0], 16)
> -            break
> -    f.close()
> -    return pm_timer_base
> -
> -
>  class MMConfig:
>      def __init__(self, base, end_bus):
>          self.base = base
> @@ -302,7 +290,7 @@ mem_regions.append(inmatereg)
>  
>  cpucount = count_cpus()
>  
> -pm_timer_base = parse_ioports()
> +port_regions, pm_timer_base = sysfs_parser.parse_ioports()
>  
>  debug_console = DebugConsole(options.console)
>  
> @@ -312,6 +300,7 @@ tmpl = Template(filename=os.path.join(options.template_dir,
>                                        'root-cell-config.c.tmpl'))
>  kwargs = {
>      'mem_regions': mem_regions,
> +    'port_regions': port_regions,
>      'ourmem': ourmem,
>      'argstr': ' '.join(sys.argv),
>      'hvmem': hvmem,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index d884089a..0afe7e86 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -47,7 +47,7 @@ struct {
>  	__u64 cpus[${int((cpucount + 63) / 64)}];
>  	struct jailhouse_memory mem_regions[${len(mem_regions)}];
>  	struct jailhouse_irqchip irqchips[${len(irqchips)}];
> -	struct jailhouse_pio pio_regions[6];
> +	struct jailhouse_pio pio_regions[${len([1 for r in port_regions if r.permit])}];
>  	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
>  	struct jailhouse_pci_capability pci_caps[${len(pcicaps)}];
>  } __attribute__((packed)) config = {
> @@ -154,12 +154,9 @@ struct {
>  	},
>  
>  	.pio_regions = {
> -		PIO_RANGE(0x40, 4), /* PIT */
> -		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
> -		PIO_RANGE(0x64, 1), /* I8042 */
> -		PIO_RANGE(0x70, 2), /* RTC */
> -		PIO_RANGE(0x3b0, 0x30), /* VGA */
> -		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
> +		% for r in port_regions:
> +		${'' if r.permit else '/* '}PIO_RANGE(${r.start_str()}, ${r.size_str()}), /* ${str(r)} */
> +		% endfor
>  	},
>  
>  	.pci_devices = {
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d51bd3ed-a3dc-59da-b2db-2b4845d7cae6%40oth-regensburg.de.
