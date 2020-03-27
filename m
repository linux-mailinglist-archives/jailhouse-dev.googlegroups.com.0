Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBQHG67ZQKGQEHNMFJUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32A19572A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 13:36:16 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id b12sf8123747edy.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 05:36:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585312576; cv=pass;
        d=google.com; s=arc-20160816;
        b=aTq3pNqxOGAI9g9W0mlnLFbqlAoRKI6lEduIEvhjG4Xip6OHVMOcnteQqTPnByN2/e
         beneha4GHr4dQePzsnZJbiprA+H+iPWh2vx9Lkrmnvg0R+DDfsLEhAKr87QWRGTUeoeU
         MCudnLkTYTEZr27/2W+MRxB70VT9NdZTpvmfqyhpnja5LqBgGoIqPhj6iCwqG6j2oOZ7
         LIRZYdoGVAStHLCMSZvkd/kG3PliD45gi4EPRgx+ru5IVCITEpG77MYfXwWkM8poCrvu
         wPe44ANGTRg0nAtkgsfa7OxBzLCc67Z4IJ/2wtyChCSUw4eA4xmx4R8a4lFJc7lRlNx5
         iF8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=poaq0mIa8GvYfIYos10CvMtxS5fu21LMqMBBu7g2uvU=;
        b=0OqYvPK9RHg0STOaNTQrMs50f+vefnUK5lF6eOR1jSb9XN2s8c5ALDvMmc+v72u8UV
         Yu0GBN/K9gKCRaDf5CFWtImN7zQy80meNwpqAVKHtCpCLGNrXu7o3ox3EYpwiBknN+Oa
         oORfuAcDPaA1BidXQaRVDwyFSjWcOR8Q83M3/Xq1ae2AgWhHZ4lmzptCPHP1Bdd7waOS
         ui5ElXpiQZWu456HBE2yXiCmaQD76KsRBZv+OwDKO7Pnu+y3Odw1brTH/xa4Vdm7qCT3
         jVkp2XKTi8oKyJAHoijx2R62/Su72TTlHVc41VLENJuCsK2NjuqoD0Mvu7l3m9J84jpd
         Abhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o7IbEme9;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=poaq0mIa8GvYfIYos10CvMtxS5fu21LMqMBBu7g2uvU=;
        b=SybDcWTSky3EM8RFi4fXaADUtonvZqNapU6D/c61pbBiiVEIBM7oQTS1Q4lAalpm79
         nxo2+0o/fWjw7stxFO/fCY/4bGnMAX4QT2C38tM9PB5FPDtJmaLdJ9VrtknAg38qd/9N
         ITCTJv9rFcWeW5PAdilFpJs/LzScR+HovW8RSfD55c4Mn8r3xdHJHnsACXRwgnQazrYm
         8CUjgcn9BOYg+aWH3WwLzwedwydHNfR3q3sJv5VeFxcHE15+7gfcQglP2iZAZSfN+sY9
         UUO8Y0Mnt8kstajoVOgE+w6HjdRNWkjiwB1WlacgrZLSP32klu9KQotBXxi+Y8w0qeFr
         pKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=poaq0mIa8GvYfIYos10CvMtxS5fu21LMqMBBu7g2uvU=;
        b=VL3LBXjjfmn+c/g4L3Unvnuhm0fNV5jUL5i3PAaiRI5HIEyHn3gdpXCuqTccswyGuN
         +UeaupdXfmSwGksHnuSNHz49n9D4eCxEzMzqoekMzG9HNsaisl3tXkJ8LzC6ItBVj6nI
         gQNpweT59V+xczu8OowYvtlk5fzuuoroHbPasQ00iKAQ2U/37yrSk4yC+DgG3td9Lg7e
         6i+HXEh+wXJYf6qBug6V8vL1SRLP9y2AjUX6Hg83OB5JpUAYbQt3LryUEvWue5RQ1mqd
         6OqdHgS+qAmHnIpm/IMxc1vqUKjoX1DA6oOD3v0gmmFA8yxe1majYHYIZadh8nFYL7ph
         EOwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3sgT6F4+eMMVPc88wW1oT5W4cEsN4MHpLDcTwQNPUCMmKq3MHo
	5aC8IYogEHK9oQzXy7MuX6Y=
X-Google-Smtp-Source: ADFU+vsaMss9MMDTO2M2WwXZS6PyFnsi5YlsRohbdBdGKFjfvZVhGyVR6edbSOxiL4fszeo8JO6QJg==
X-Received: by 2002:a17:906:5796:: with SMTP id k22mr2467ejq.352.1585312576641;
        Fri, 27 Mar 2020 05:36:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ce14:: with SMTP id y20ls6470764edi.2.gmail; Fri, 27 Mar
 2020 05:36:16 -0700 (PDT)
X-Received: by 2002:a05:6402:1b10:: with SMTP id by16mr13306404edb.379.1585312576084;
        Fri, 27 Mar 2020 05:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585312576; cv=none;
        d=google.com; s=arc-20160816;
        b=XUVOmFj2WHujYW02qc+2nkI2/gq2IZQ1v5KProSyo+xVIv/nN1k+qjC6D5SGH7/yK4
         d92q2VpFBIN8Bodd9UZF02y6dKPdsstLceOqdwEvVVFO/SFXCFxZ0X5nC2NfddYQnn0I
         BYq3xSw341SB853QG/u33329KLkQ45KBZVk1Pf+HpxAfpCbFXAikDfHXzB7yc+cJsjN5
         afOsvFc344aaYiTFdG8cQCe7Bgf56Wbj289BICXedFg9NBmjh6t3fDWRHVfDtto7rPlt
         Gu0rj91aJATS5Awc2OqH9ZPBx2XfxijkTg2wjD9POMIkrjXfm6mghzXKf0t606SUvICo
         FN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ISeeUsjrN+TMUwo5e2SGt+nBS83fjKvltkRTI8xa+ko=;
        b=1FHKBLJ49FeyK90kes2kqiywb7b9NpyaodfZ8cfzwv89VQg8WJtU0CUSC6qvXutejO
         0enKPtm4dqUuD6U0YZ0J9diUFy4FQ5uXp9s291M1pVpppkpcZV7LH8dldkeDGB5NeosA
         9r3xMEwH7bWsz56T17Rz870ka2sZXVohZfeCpLTgMcr/HSsu+zYZnBn8K/JdpiCDD+kV
         CXEze5qaosPWTNqzR4Lm/k73QJs4vpo/3ullt+ZZ4dAyPNn+Di1NVjXFLdSiJsU5occB
         lYFhMfkk28tjnNgtnOIoRStSM1gB1RAiQNGu8ah7L4KI28n2upb8aJ+NsW446tjAro3t
         pHMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o7IbEme9;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id be1si210014edb.3.2020.03.27.05.36.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 05:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Ly7vR-1jKa0g2S6X-015XJP; Fri, 27
 Mar 2020 13:36:15 +0100
Subject: Re: [PATCH V2 1/2] Cell configs for imx8mq EVK board.
To: Alice Guo <alice.guo@nxp.com>
Cc: Henning Schild <henning.schild@siemens.com>,
 jailhouse-dev@googlegroups.com, peng.fan@nxp.com
References: <20200326132025.5116-1-alice.guo@nxp.com>
 <20200327121102.12ffdf7d@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <785a4aeb-3ddf-db6c-42ec-f0c606795bff@web.de>
Date: Fri, 27 Mar 2020 13:36:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327121102.12ffdf7d@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:Js3rEOd4Y8O9QSM6IFyQFcA6ZCd6cx2tRwVIuvvsN9Lv/WvjLh5
 qiA35+xAMwtQCQEfsLBuZAE0TTtNTkoNnEH/pbAVB7VdOQwVgbTlSCJxajmhG8n3J+ZyKih
 pZsmKFC6Oss3XN3YFLkIaC0jRcgHi1Qo5akjed7a0tPJPVie1364Y8C2gAyrSCzvL9rZaIe
 rGmRCCe2L1CwrE8sAkNvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6rMHgoHQU60=:q51OzOqVp9u3kLZd0CMIIV
 scE7v+K6+b0FvY9ij3oUP3jolfEehNChyLDZXIAIC5kwbFJYCvI5QmVWaicmVMHR7Qa73ABie
 WGitGNGDOfE+KAwX1B7ATm+YNQbENSZSbKnkBx0qYBC6b5fdtC3/WilC3VMHazL9EMOfgXNC/
 S0tHJ0Oze3oSOETs8CmbY1PYWVyN8cvWmaOFfiEjmTX9xfo5pjrZ78T/a6Nw09PzuWXYe1xwC
 wnxJ4LujFnh/udUdmcHJopwXH9xbgpnv+YC1DidMuSNkQ5ZsZgBOnHf7ul/VRUwN5h6pagv4q
 XkLAjvxW6/YFYC7GmvIJkZH2fxAdPCZ4raKXs8vdn6EJTo9i78Uxy8nedvsWRqX6eDIWnTjaN
 MUBXvYusQPw+pRlEwRWeKKqNOy2NtCNmm+aIGg/8q8sU/jBmK6QNxyZBdVg4yay1icuhiTGq0
 XVtM1ijEUsmn9oYwJ6BeMmp75677a3mfqg9EM7qv5KLsg9a1qZ0bKQuQueveeunHU6rFS+OuT
 HIrZslBx0+9/PPzKVr2ZXvlBwnOKDCpx7JG1SnwY7cto5FehNJFOwA5H7FMR4ciQaL0fzr71e
 IoS2+VNgREaP7YyB/IQ9EYjIhgrQuYKx1872vWUXi1QuIO9II12deD66SIK0dVW59fli/bssa
 oe/Z5FsQWsaT7/mV5Ot+kIAH6y/8edwZLbUXmImQ8TeWKhu0A23Mc0Ak4z+jsH6bDQOxiNO7b
 KJGIEC2Ja1i9jhEqg7aKVIeYU5tFu4X3OfvxSnt7QSLHrolDBUiuBu2eWzxoAAD6uMy4V83QW
 O12fFJtowzqIks+k9MAOicXHz3KdLeNDLzmP6IYa0TcaZu4to3f/UFFB6dMUvqnrw6WyXkC+6
 rBhX1bA7yvWfAnveJ93f1OHN9Wi46+5hWVnNc50FYQTPtHR3/mM2eJgsiBWoYT0kwp4IZ/W/D
 7WS5La3RCZlGh7W8nnBRAgh1n2giNjj+siXS0qvYEj3D1/132AiA28CgOdBHVAglprLS6N5Rh
 uLFxuzPIBEQCsl9u25vLZdwrfdAOzVpi+qnUNGzNPC7WGNsWzOvgVOIbuvGEFmYnS0/4rmUya
 K7zkpF8uZr5tKgzvzEbdpuH9Apra3bMUBkgjjD+cpGJjj+HRp5wbBQNYul3VGbMYS1FVonhe/
 /moWL3710kjFf2zcRgcr5dHjJvF9rmWc8+roT0WfJrPOXFYmMHWTcEL2RtmsqC57P7Fsv1Nj3
 rXB9HFdlxbJn+SAmv
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=o7IbEme9;       spf=pass
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

On 27.03.20 12:11, Henning Schild wrote:
> On Thu, 26 Mar 2020 21:20:24 +0800
> Alice Guo <alice.guo@nxp.com> wrote:
>
>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>> ---
>>   configs/arm64/imx8mq-inmate-demo.c |  70 +++++++++++--
>>   configs/arm64/imx8mq-linux-demo.c  | 158
>> +++++++++++++++++++++++++++++ configs/arm64/imx8mq.c             |
>> 93 +++++++++++++++-- 3 files changed, 307 insertions(+), 14
>> deletions(-) create mode 100644 configs/arm64/imx8mq-linux-demo.c
>>
>> diff --git a/configs/arm64/imx8mq-inmate-demo.c
>> b/configs/arm64/imx8mq-inmate-demo.c index 8c1ad624..d3c89aec 100644
>> --- a/configs/arm64/imx8mq-inmate-demo.c
>> +++ b/configs/arm64/imx8mq-inmate-demo.c
>> @@ -1,7 +1,7 @@
>>   /*
>>    * iMX8MQ target - inmate demo
>>    *
>> - * Copyright NXP 2018
>> + * Copyright 2018-2019 NXP
>
> Maybe even 2020? And that is the only update to the several files you
> touch, maybe do them all.

I can fix this up on merge, just let me know.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/785a4aeb-3ddf-db6c-42ec-f0c606795bff%40web.de.
