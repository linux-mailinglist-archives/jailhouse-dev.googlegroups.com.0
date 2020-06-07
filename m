Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB3P46P3AKGQESBMYRGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A91F0C23
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Jun 2020 16:49:18 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id b65sf4330156wmb.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Jun 2020 07:49:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591541358; cv=pass;
        d=google.com; s=arc-20160816;
        b=c5/sfS0NRtcrWiVlmELn4gKUXEZd1jM/Jxb8fo53I6l8ulYCa44cRDBXZx2vQyNZKV
         ayMYdJ5c6cC1m0n7DJkzsxyX8Qy1p9s0UxhRpxZGhaGCDrK39Q95i2NL4T1bLvUyqOSH
         ERhySHdtElxHEbYolgcST15a4vWyiJsujab0uqvLOBQfCrlfZ1hgpiczQIWL3aILK9JF
         w4N7Z6kejQqi5WOnkkDhDqn4jk7pXAWJ79sDOj8BYQAfKiTeNrg3o701Y7J7Jpmy6Jlv
         gFAV9a5s1g6+CDdRMLp80NZYfd3HWJq8Z6LXW/fNyQyWWSgIBsKPYZkoh2VGua8msf9G
         Dx+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=wdYGAd1dm2PoDdMcRmVXSh9bkdKLuUgOkZ3WW6gqIw0=;
        b=P3z9sK8QAjY5TUemr7tD3m4ZdYXKSAAyF8tG0/8V5hZQE9Fcv+vxW0YRIGWcvAAK66
         qBopFcrt9RjEslBh4tvfK2A0zffXOKs9/jymEJ0QXDun97ifUOnzjOWkWBTUB+tGrat9
         TLsg1u0eV5KnD5ucMAsS3rYnY2jgvsDTBb/DBxSNbDtkmfqGhNZqNiLMlhYjfwACISMA
         EDjFbrwV3rSmzkoKF3ixZf909WuXBT4rzo3RF/R/AOwJXWWuxhNAmmiHc13PUFKjX8TA
         NGjPSmVnWg5Q5yDGt7Kf0ju0LVaQI6Lp0TOhuf5bkIMzfRpiTQKrX1BB8tgiROfYwOfM
         +6jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ab1P9MJw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wdYGAd1dm2PoDdMcRmVXSh9bkdKLuUgOkZ3WW6gqIw0=;
        b=dn9kSFCWcSQwxdgH121fU3SXjHyLEzW05LPTp4VP3ROqDG8A8OVzAcDi8zL4BEHIbj
         D57DtZdrzJlCE7qftIyeGWuc/QPVZboglHgi9YDqzuna4EBkdqyPq//uI9TxAXNVTVlZ
         n2KCmZ3VIzzca6DBm6N8XpXshi/TzdYrgsv6jhCIJKU2aBDaiWvOFJN1ILtgk1vhar1p
         j6I7abklwFdzbyjwsV0P9r3VasPaYKgRYRXFYgTyVLP+JtTgIYRn75XLyYbfv9BgLLnP
         2CTDt+rpzdDCOiV8R8Vbfy0Rgg3pbdh/d/uM2h39mlaxE0t2yIxVsitvBOcR6XGBAFqi
         x40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wdYGAd1dm2PoDdMcRmVXSh9bkdKLuUgOkZ3WW6gqIw0=;
        b=I8My2L2iddjNZlkPmSQ+9DrZRdtlw2RMcl4gnxq+rSzfLSsITyev3dhh756/KaT0Mt
         XH0YWfcr6Iccyf6Awzg9HTqiuo7/1O3QGIylr2oNIQVSRy4UdnV+ulW1RIzF/LHMCEyt
         M/WONpUGGk+6vycZmh8sCR+aqthXcUVBxTbyxHzO1mU/r5D/nFUsWC/VhQRGxTbNxEy4
         9bUvVVKbe0VFwpdPOjazrcqnInPYp5XLY5IfXC7EXgzctEOpgElpJ9Z8Ly1bhhs0Ch9V
         u0ZlP9mDg1UETo8Zew/nBafWhRynXls59DY4In9sT/b0O37w+yo/Yk2Y0CY4KzOZkzLD
         ZH7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OqvjdUbxHAKMFMNqqdv6Nd02Rmz0+oK0bZCP4foZHHKDtK5Hx
	h8vrubTly9PaCdYmXebtwl8=
X-Google-Smtp-Source: ABdhPJwMDHOMU704CuewRW0WzIm5xXy0DgZl/KQ+vNBa0BW90OPfr/NQb5akIR3XqNBoeVUjJwAXBA==
X-Received: by 2002:a5d:4d89:: with SMTP id b9mr20558128wru.210.1591541357826;
        Sun, 07 Jun 2020 07:49:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls6776538wml.2.gmail; Sun, 07 Jun
 2020 07:49:17 -0700 (PDT)
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr12782663wma.83.1591541357232;
        Sun, 07 Jun 2020 07:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591541357; cv=none;
        d=google.com; s=arc-20160816;
        b=gQfjb/Tod6h+qwQLNBdMfq0kVp7uqByoU3F5Sbzppeg/1Vb9WER4NQ5Pr0HCYswICR
         QdNxa0w/Evkow9nkH+2vwiDPyHj+/MqwXggUekzvg+xABZgBK3UlYLyJ/I5f0lZZqFFB
         hRKqUwyjez3GijFUT2Ecv0E4vwtAH3syL50TU7xE5QI0uw/7GY25jYz/cT492819GWIV
         hdzjvRv/MYzPYuzKakuairHU1dnQYoVLaSi10wOw/iNOUNCgDg6FH2Vp3j8CqckUfdFx
         l+I8JJZucu0T05phFgwxxeadzVLhVdHTr+Mid/RXApbTuFJLiu+fmxw4+f93DxSV2qIE
         5uHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=AtrgdPvhEuw3+aB8CYh3B+hGFANJhGHcRSSnCykg/WY=;
        b=nWWElrJDY1jU6N7NNWb3Wjcs2tOCVIn7rJG7mLLt0dg3YsGEHXBO2wZ8M7evYGr0ss
         hmQfkuqXkf0YtLltnu2jkSSHOjU23lafXtYniqMCjs0sda+Du0eBi6ZRRh5zvWEFg/6T
         /ZaHmWrf6SxCCPSEaLViTtVdzf2eokcvAp/GFQckn8UFOIy6TkukSvSw934MwwyTpk0K
         EwSRjY/g1QoWuSNT/QwUTJSg2rlXYBsvxjT+OxQ9jyRqNa5alSefC/MtfZypq9JgKU6x
         UXMChW+76QKatrMfMU9lmkxPsnxKLukHSopzarL2/oAaBpu8AKwoEf4LPsyg5WORjp+J
         2Mlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ab1P9MJw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id z18si793031wml.2.2020.06.07.07.49.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 07:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MYefK-1jVAkQ3JY2-00VTFB; Sun, 07
 Jun 2020 16:49:16 +0200
Subject: Re: [PATCH 06/15] pyjailhouse: config_parser: Add SystemConfig
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <cover.1591107398.git.jan.kiszka@siemens.com>
 <68401c86c58700c207069a9c423c2a0ed5bb7126.1591107398.git.jan.kiszka@siemens.com>
 <f3bc48a2-9676-b46e-4aaa-c0d5f046497c@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8c881040-2177-9814-f093-581ff6cd4fb9@web.de>
Date: Sun, 7 Jun 2020 16:49:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f3bc48a2-9676-b46e-4aaa-c0d5f046497c@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:Myw0hLVpZcB+vFGVuFYXIfQsptRiHhcTX03TMOrEeoA6Rf+tXGM
 ICr5cfWuFy+3boQ0iUY+Bk28Nc7A93VLMCzqJnpqMl/AH/kYjY9TBUE6x1KQOf5UBMe1gSr
 27BtYBTx3lWLARq6CZkC85MAgJc9+BViXvH/+DXDJ993NFHjgmT+4/7Xxzvxz1Z/4BvUYf8
 vGtOg+MzeRUjbT5cj4CVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xI/RHJxQA1c=:Ppj27WYIKEYG//5aIl+arI
 k910t0tXnT/4CnB12V65uNtXy9BRUbgXMF0D+uZUs8YQilexC2MBX5vv2jD3N467HOVLspDqI
 y8XJ8dQiXvBLwrK1eDWvrfjjd+AcJ3FK2N470vOitng0/fvwI3ZtI4NOPL/7CmIoMK8bgy6zs
 3Hmq+Tp6HHtzyhYsiyMxlYY0B165pmAzIF263L9+tA7cHipB5RuXpxLLHAfPxhgrUCi8YcxPt
 Pgqj5TggW+Ac8hJ15PhLUhmXlhdOgQj/Msp5DcdRjSW9HwlBmsNmQ0Y/SEyhJ3T5O9hNtbmwY
 wKKMsUgNnWFQFEq3hzqrIRlHOVfkZ9/pfWdQ9OvORCy+rbb/WBxMe5QV5qHQVLxYxy831Q2I/
 ldrfS9VCI7HCXWt1Oiq9mX17A+0tvljinxeDMoyFAQ7gRYmFiiTA31+7UCNrZ0vN/D76CnYDe
 ASpKyye9I/1VSr8nkzJv2NSPVWFXHCzOuWjBQmzqyE+Iik2sFoVtmRvBkAXwgOsCH/MDJNcjQ
 2QS1VEuQmZUY8h9HE5ZlSQUfkxnHSQN1X1BWMjZVClIMx3SXp/xIIChhj7+jlGi/HETcGrl8T
 dyFexAw5wUHDcKpUmx9VGPZM2jKAwhg/PKoXyzk2MZhbTh4N7i4VvdgA8KzwlyU7992i9Pw4/
 O9F/sv/0niYX/wcYgwTgIolVaYxbTiO4JmH79aSNm132To5bEye4UeRFrl2a9TraHFeezCi3i
 Fe0agyb+SqkOg+KfbhwQk82kHgHIjCAOizkJTovGLJFUmv2+rDkBZwkApIj0uoCvkxoY7nutz
 bWV9AMbqfrpPx71gDYjsGxxk6AGTXDOlPdJ29jYrLxcbiGp4qvBDFJVqYbIt8c5ECI7zxx+HX
 DTKyglvx3h/EGHxERZ8bo+32EHlnndp8LYbcfOIO8EkehcGA8Xb0ZeFwnxnb0RiJIqNcpqA94
 /mY2WtPwjR89jtl7K8cdGpvy/qzmc5bDA/jBEEoTcjAhB48ER5RXgUKoozl8l4zTZVzCgojYt
 Jr+2+1LUi9HPiQy3AwsLE2lmd6vY2o9MkqibDmrizczH26MNkipKxDbVB4ynwhnPzL7DQfIDu
 YVEUpMpcJ2i+OGq5c1buw2nqwBIrh/16hQbQXlMnecm68Cq/m//lvprJnSM5NvPbg9p22dC7H
 xVEbu44p/WKodmAGDoBWmmbT1jng51rK4tFkMfKBL4LM8XhzfksH5rAp8GlSjqwFTQDVAEXsh
 xGpTX9sqQ7PGdJRKh
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ab1P9MJw;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

On 06.06.20 15:35, Ralf Ramsauer wrote:
> On 6/2/20 4:16 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Add parsing of system configurations. This is so far only processing
>> essential fields needed to validate the structure, extract the
>> hypervisor memory and access the root cell data.
>>
>> The root cell is parsed via CellConfig. As the embedded cell contains no
>> signature and revision, CellConfig needs to be made aware of this mode.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>  pyjailhouse/config_parser.py | 43 +++++++++++++++++++++++++++++++-----
>>  1 file changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
>> index 43dc1dbc..2d0967d5 100644
>> --- a/pyjailhouse/config_parser.py
>> +++ b/pyjailhouse/config_parser.py
>> @@ -90,7 +90,7 @@ class PIORegion:
>>  class CellConfig:
>>      _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
>>
>> -    def __init__(self, data):
>> +    def __init__(self, data, root_cell=False):
>>          self.data = data
>>
>>          try:
>> @@ -109,10 +109,11 @@ class CellConfig:
>>               self.vpci_irq_base,
>>               self.cpu_reset_address) = \
>>                  struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
>> -            if str(signature.decode()) != 'JHCELL':
>> -                raise RuntimeError('Not a cell configuration')
>> -            if revision != _CONFIG_REVISION:
>> -                raise RuntimeError('Configuration file revision mismatch')
>> +            if not root_cell:
>> +                if str(signature.decode()) != 'JHCELL':
>
> signature == b'JHCELL' is a much simpler comparison.

Your own code, originally. But we can change that if that's the same.

>
>> +                    raise RuntimeError('Not a cell configuration')
>> +                if revision != _CONFIG_REVISION:
>> +                    raise RuntimeError('Configuration file revision mismatch')
>>              self.name = str(name.decode())
>>
>>              mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
>> @@ -137,4 +138,34 @@ class CellConfig:
>>                  self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
>>                  pioregion_offs += PIORegion.SIZE
>>          except struct.error:
>> -            raise RuntimeError('Not a cell configuration')
>> +            raise RuntimeError('Not a %scell configuration' %
>> +                               ('root ' if root_cell else ''))
>> +
>> +
>> +class SystemConfig:
>> +    _HEADER_FORMAT = '=6sH4x'
>> +    # ...followed by MemRegion as hypervisor memory
>> +    _CONSOLE_AND_PLATFORM_FORMAT = '32x12x224x44x'
>> +
>> +    def __init__(self, data):
>> +        self.data = data
>> +
>> +        try:
>
> Why to we need such a huge try block?

To avoid repeating the except block. We need it for the unpack_from and
the MemRegion instanciation. We do not need it for the last two offs
updates, though.

>
>> +            (signature,
>> +             revision) = \
>> +                struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
>> +
>> +            if str(signature.decode()) != 'JHSYST':
>
> Same here.
>
>   Ralf
>
>> +                raise RuntimeError('Not a root cell configuration')
>> +            if revision != _CONFIG_REVISION:
>> +                raise RuntimeError('Configuration file revision mismatch')
>> +
>> +            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
>> +            self.hypervisor_memory = MemRegion(self.data[offs:])
>> +
>> +            offs += struct.calcsize(MemRegion._REGION_FORMAT)
>> +            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
>> +        except struct.error:
>> +            raise RuntimeError('Not a root cell configuration')
>> +
>> +        self.root_cell = CellConfig(self.data[offs:], root_cell=True)
>>
>

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8c881040-2177-9814-f093-581ff6cd4fb9%40web.de.
