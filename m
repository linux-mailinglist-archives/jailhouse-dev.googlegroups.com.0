Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBI7JZCKAMGQEP425JCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A9536D52
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 May 2022 16:41:42 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id g3-20020a2e9cc3000000b00253cc2b5ab5sf1669850ljj.19
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 May 2022 07:41:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653748900; cv=pass;
        d=google.com; s=arc-20160816;
        b=NriAsGrcmaoyomhXItDlbB0k26ev+rXL0YHoCHyXbqN2Bfik7PScXHJCqQP0UC4qkM
         QUr1nHeBE0VgPl/fO7b88Rjr1eTjIxyiwJwHP39qNgGBbb5d+v/PswZiAFkHLA4YFaIk
         XZdVm6+w6SQcVoDgiOFWNfSRcIqnzr7Jy7rynIEagiqZeC2Shi/vTqk8tfA8Tu73yhzx
         8+4GP86cisXympRT6jTs5nkl2/hm9co+WUZYYTgTVuryZL5TpDU2ul8uZSxt4mARU09g
         jUXJ0DPpwwJXLr9QBsaV9MnQ0VO3huxTRzpSySrAE5ZRmWzjqFtWoZfSIM3tphTeOZGB
         1F0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=WUu8+eaF5JB4K1eGe6TN3TRCy7Ntz7LVeWrPTWdqWxI=;
        b=uYgEXsojiha7FBg/iLciAKbgGFwcRn3arwFgRnrA6px0IkCqGa/FTwCCngitXnm4yS
         ytZE4j8TOK21InCNqVMxjnKA9EtrQ17WZ4HB/fPuOxckPdHn/5Bwb9FO/A42WU6Oifg9
         oTRdMZpFLFnbICw3rvrpgD6ilE/q9Bxpa4rwYUE16jS63ssjfHa9xtco3+00kvxOwTiC
         oNOCzTcgH0wgrebz/lgTkVhorJX3RCZfadMXbmNjycJ1SwKd1ea5cJmzdT+YGozuDGlW
         SgNqAkAlfYmtJncXLq6jP5kce5hypO4AhpXdAhymAbwHBkISqDrazEq2xqemTh5njN7L
         cRAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=i25C6p3c;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WUu8+eaF5JB4K1eGe6TN3TRCy7Ntz7LVeWrPTWdqWxI=;
        b=mu+0r/PaZey5tVBMYWnxinZxGeP6GWYwt0kq+oqHbtxTblwHWmYEU3hg5ob2RHbBm/
         LdGbpXKSfLvOAHFIxRPtxw8CeAanq0fXN+74l5EVkAdGW7yX5DR2j/JcFfmCvyc3oRij
         f+rJlkflmK/uuMSFlpl6g+bZvzpcJDFyyDQHCkiKH+vwiSskE2zYx09JFpHG82AXFbIK
         6CoC2ALtho6dsQR334JEKdgi5Z/SMykwCneXsVq8gylKYcmpuVBpanYMUSie0udBmdtr
         H6Ji56d3dycgla9aJ8AI4xRd+kL26LUzzbhMDgowQQxy+Cl7s62mBGWSp6irKgsjuROy
         fwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WUu8+eaF5JB4K1eGe6TN3TRCy7Ntz7LVeWrPTWdqWxI=;
        b=dVFCgGC/Ak+rsOCA81pYQMVNitZdtPr04BsKzHIkWvE8lJ0P54uSgyb3xLeL/JLTl9
         2RMCSD+gMIYBpa5rMMkymOATnUtMXSPrjGuPtHuRvBy2B5Kgfthw8o5IkQ9UTdneMPiV
         5XNwcOD4p0GLMVyMHtxAUsGrPqlIHKw0deEV27lsUvaidog9fXcA+Y1rpkbBJioaoaGH
         OfAvpu2LgCoytFnnkrE53/z12jULnJlm3lbV9VjbPnoJLgV3VCDzQyjiksEh5wu9LQgg
         Af9q1myK7iXJfdESBq4fRdcypCw0BQUjd8ALoow5Dplkp7Rktvo5inKIu7Q65Q7F/aOB
         b98w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bMz2ExI99Ja6pD/9NaNkSiLSsDRhyHmBUgVJhGytEv7Et2eux
	246wqy+BDGQ5anuW3+WeLus=
X-Google-Smtp-Source: ABdhPJxJg1E/ZbynuioX1zvhw6L/TA9beCF+1OZAij0DWsv5+n+96gO5elCzn8bCdtFQGvrDcVOBKg==
X-Received: by 2002:a05:651c:887:b0:247:f630:d069 with SMTP id d7-20020a05651c088700b00247f630d069mr28599550ljq.514.1653748900469;
        Sat, 28 May 2022 07:41:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10cb:b0:478:7256:822a with SMTP id
 k11-20020a05651210cb00b004787256822als2724987lfg.3.gmail; Sat, 28 May 2022
 07:41:38 -0700 (PDT)
X-Received: by 2002:a05:6512:128b:b0:478:7e7e:7383 with SMTP id u11-20020a056512128b00b004787e7e7383mr19491628lfs.502.1653748898777;
        Sat, 28 May 2022 07:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653748898; cv=none;
        d=google.com; s=arc-20160816;
        b=By5fDx6sjMbtk0BAgmiIz94scNpyHZ9e4xp4QFMidqsyuJK2GAtcXP+RjX1hOt3+dQ
         o8LTpUm9/72ZGKMj9fSTm+BuQZEXBDUi06QDRVRmBT/WDDTYGlJY3JUWgJGAVKPY/lpt
         5Q4zNGayF4uKGVzv37/Ubs2TaX/pC+poY6nlppoZpY7zY+FhEdqOwZyJpU6U6UtSmLMJ
         9HQIkhVQK4ZVFPYo7/WQ+xe5TqbMla4LIKoQyQCO2lXoqU04eUKn9VZ3Euoh74uaq4un
         7psWLkcmPmOP2YON5Z711liowIL4Ls6ml9H7wR8LhxBDy9vlEokxy8UaxJdzgzusU+69
         +QQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oH9wFtOeXfwkLXUbiC2jlU6vNiIZexjVjx6UxoU9rR4=;
        b=UF7yb03zKhbHjkZQr+Wohrab8PnyTFNHZQpVr+H8NrrtMy2sMZ3s1DATAe65DhefCS
         kJdtR2xO0orzaKXQfM/6NfTcvQXgN0S7vdHoC+kwSgS81BqrLXPKJLaXZ7aRoyVsA1ur
         ZeBgwnrncUamt3+GyaRjWh4mb8a7YdfENWQHTowJ+io4xZT+qtdKNN1zE2bLLLBFRVBP
         DcWFX2uZtNh3PXZCz610MX9ntWW9GkgNqYI/GLgQEpZK9hnvjD8WMM6k1cKeri0KA1ga
         lRD/nIrtFrrumyy0nR0oxj8dfepDVKhXsZdLyI1F+YGsuoPmsz6bOBIEAezwbjkaqASr
         YOzw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=i25C6p3c;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id k22-20020a2ea276000000b0024da01a8c6dsi304950ljm.1.2022.05.28.07.41.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 07:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([88.215.102.122]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQyl-1oIuhW1uZf-00Xxmx; Sat, 28
 May 2022 16:41:37 +0200
Message-ID: <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de>
Date: Sat, 28 May 2022 16:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com>
 <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com>
 <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
 <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
 <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
 <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com>
 <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
 <5172e723-49ce-a870-2066-d22f44115da3@siemens.com>
 <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:sC2+0iDkiPgvehhmq8FqEQcwBjKxjfOrcfGEva5CoCKJglJw/Gn
 XiCYie0IfhNa57OJIk6xl83A3pRF2eg5DSDfujmgqvC4Jb/GAq8XSzNq8AZyJVDpgBytJ7M
 nnbWFSKDl2iZkbyBSKmM7uEYjL1hJR2/a/wSfZVgw1B0MGNNFKezI7aSRll0KGWUej0DVO5
 9hTwzmXwJnUm1bjAa8LLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GKtYyeJAQic=:2GByILfuLUsqZvL2AZPAJw
 cowXx05B418iIXa02D4rKXDh4cwgten25nFz8pY0sRP5DQZlMb92WE2SV2H2kTTkfcsql+huS
 nQ+WpYsI+NE5Z6xHqa6ZrJPzZzGJpxoSX5G+a/WUNAqqGplUuND9Ly9ETxvtF44CvnB8JY6ic
 npXAUuWTymP9D7NbbymhNOzFbhChxPEMCuWmNt7q1BBpOxPvVPy0mHHKb5SGbcdnaRf+/e4dD
 4U8grsFpjy1YjtZOyBN9mV9lqLEDylO86AjyAKBkKVEwUptMGUPUIMBXTDIbq5tD++sR3e7/b
 d4xy+s+55C9EoDVOX8HSxACXXTmfWGKrDylgGz87l9knx0sSHjplFJRs0+025PsxxvfZhFsmH
 giwqt4neTYWjza8Iyp5BFaaadEweTiHdo4+YvIhL7yHAtjbRGkWieSLqHV/HhwwaxSZ6QvuLO
 Tefn/+2FQjtMRVA6CragNCta/fY5q7FmLser+jmEN5pxsguQ8Olfu8oPboIFEEIEbRbchq3e3
 u5L9NvbLWh50SI10Hu1fZIGpsstGWcCciyU8XO+3CKF+kLJH6sl0qI1XBrWtdZ6AF9Bd1Xe1i
 DTcH3mU87QkMjqn/0MTPMtu5i3MLVq762Ezv7B7xzT/+TFMFm0GRy1dCt5hq5RY35xg9+oAfR
 imqYpu9RMZY7vKYUieFpS1pTGEphiEDFdv4zfbjjq/mZwJZf5jo6Pg8EPTbRB/K7MBWaZKrPH
 ULinrHpYzkWU9aUR+ifhhxght5eX1Ymxl7qSPjm4vPSb9FQ6vZB+Xpbs2nAV5aFMZ9YOreHdg
 vehj7LWXytn044X1THevfBdniUgbQJOiaM76OvBsAvCQ8dFRLVJgzCsNJ+akMxTSZSttOQFXo
 Rm+QO/V4uiI3tjMV7L8MP2zon1k0Kk/1gz17DfLoYzmazgep5JKSOGn1yq9z9e2VsA0d2Jhxo
 j6+IQAnO85S7bHtz6MLcpYn7J624b2Z66Sn5sgZUXWqnofcGlQr8oto7ymEXuwvZ3RaNEtiJw
 fM8V9EZqw/irgIIm0LXKyrmh70ZNi0kw9BRy7OUMMVox+/EfvoBegq9r975cHRiLiRedoIRnk
 am0y1wdR1Mz3VfZnKVHOGhF5WbT6YJpIi+ERFVNTIZ+nj+QuTLYVUGyvg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=i25C6p3c;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 28.05.22 15:22, Lad, Prabhakar wrote:
> On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 26.05.22 17:48, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Tue, May 24, 2022 at 12:55 PM Lad, Prabhakar
>>> <prabhakar.csengg@gmail.com> wrote:
>>>>
>>>> On Mon, May 23, 2022 at 4:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>
>>>>> On 23.05.22 15:55, Lad, Prabhakar wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>
>>>>>>> On 19.05.22 15:23, Lad, Prabhakar wrote:
>>>>>>>> Hi Jan,
>>>>>>>>
>>>>>>>> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>>
>>>>>>>>> On 19.05.22 11:44, Lad, Prabhakar wrote:
>>>>>>>>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
>>>>>>>>>>> lr, thus the second ret will only return to where the first ret jumped
>>>>>>>>>>> to - endless loop. You would have to restore lr (x30) from x17 in
>>>>>>>>>>> arch_entry first:
>>>>>>>>>>>
>>>>>>>>>>> mov x30, x17
>>>>>>>>>>> ret
>>>>>>>>>>>
>>>>>>>>>> That did the trick thanks!
>>>>>>>>>>
>>>>>>>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
>>>>>>>>>> index a9cabf7f..7b340bd1 100644
>>>>>>>>>> --- a/hypervisor/arch/arm64/entry.S
>>>>>>>>>> +++ b/hypervisor/arch/arm64/entry.S
>>>>>>>>>> @@ -109,6 +109,8 @@ arch_entry:
>>>>>>>>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
>>>>>>>>>>  1:
>>>>>>>>>>         hvc     #0
>>>>>>>>>> +       mov x30, x17
>>>>>>>>>> +       ret
>>>>>>>>>>
>>>>>>>>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
>>>>>>>>>>         b       .       /* we don't expect to return here */
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> With the above diff I do get the below:
>>>>>>>>>>
>>>>>>>>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
>>>>>>>>>> Reading configuration set:
>>>>>>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>>>>>>> Overlapping memory regions inside cell: None
>>>>>>>>>> Overlapping memory regions with hypervisor: None
>>>>>>>>>> Missing resource interceptions for architecture arm64: None
>>>>>>>>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
>>>>>>>>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
>>>>>>>>>> [   46.611311] The Jailhouse is opening.
>>>>>>>>>>
>>>>>>>>>> So it looks like something to do with the debug console. This has to
>>>>>>>>>> be poked in the dark or any easy way to debug?
>>>>>>>>>
>>>>>>>>> Well, we do not yet know what goes wrong. We do know that we can call
>>>>>>>>> into the hyp take-over stub and register Jailhouse with it. We do not
>>>>>>>>> know if we will then end up in Jailhouse in hyp mode and just lack
>>>>>>>>> console output or if we crash on entry already.
>>>>>>>>>
>>>>>>>> Right agreed.
>>>>>>>>
>>>>>>>>> To move the uart console out of the picture: Did you already check if
>>>>>>>>> the driver you select in the Jailhouse config is actually one that
>>>>>>>>> should support the UART on your board? Next is to double check if poking
>>>>>>>> The UART on this platform is almost identical to
>>>>>>>> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
>>>>>>>> patched to work on this platform.
>>>>>>>>
>>>>>>>>> registers in the way the Jailhouse driver will do at the addresses you
>>>>>>>>> configured will work: Pull the code into the kernel module or even into
>>>>>>>>> a userspace application with /dev/mem raw register access and try out if
>>>>>>>>> that works in a "safe" environment (without hypervisor mode).
>>>>>>>>>
>>>>>>>> Sure will give that a shot, any pointers on doing this from userspace?
>>>>>>>>
>>>>>>>
>>>>>>> Something like this may help if you do that the first time:
>>>>>>> https://bakhi.github.io/devmem/
>>>>>>>
>>>>>> Thanks for the pointer.
>>>>>> I have tried reading/writing from the hypervisor location and that
>>>>>> goes all OK.
>>>>>
>>>>> Means, you were able to generate output on the UART. Hmm, would have
>>>>> been too easy.
>>>>>
>>>> No I meant I was able to read/write into the hypervisor memory which
>>>> is reserved in DTS.
>>>>
>>>>>> To avoid any issue related to debug UART is there any way
>>>>>> I could test this prior to enabling?
>>>>>
>>>>> Not without extra measures: Without JAILHOUSE_BORROW_ROOT_PT, which
>>>>> applies to arm64, the driver will not map the physical UART page. That
>>>>> only happens in init_bootstrap_pt which is run after jumping to EL2. So,
>>>>> we the jump goes wrong, you cannot find out where you are.
>>>>>
>>>> I see. Just to confirm it's not the debug UART the watchdog is enabled
>>>> in Linux and I see the platform reboots after 60 seconds, which is
>>>> hinting we are seeing a kernel freeze.
>>>>
>>>> Just a fyi I tried the queues/jailhouse branch from [0] and still
>>>> seeing the same issue.
>>>>
>>>>> Do you have the chance to get hold of some jtag to find out where the
>>>>> CPUs are?
>>>>>
>>>
>>> X0   FFFF00063F7ECD88  X16                 0  ^S+ ^Stack_________+
>>> X1                  0  X17                 0
>>> X2                  0  X18  FFFFFFFFFFFFFFFF
>>> X3   FFFF8000112870E8  X19                80
>>> X4   FFFF00063F7ECD80  X20  FFFF800011179000
>>> X5   FFFF800011179A48  X21  FFFF80001130BE70
>>> X6   FFFF80001101E000  X22  FFFF800010DFDED8
>>> X7   FFFF800011179000  X23          86000004
>>> X8   FFFF00063F7ECD80  X24  FFFF80001101CB38
>>> X9                  0  X25  FFFF800011308000
>>> X10          00040000  X26  FFFF80001130C000
>>> X11                 0  X27  FFFF800011182A40
>>> X12                 0  X28  FFFF800011182A40
>>> X13  FFFFFFFFFFFE0000  X29  FFFF80001130BC40
>>> X14  FFFF800011192008  X30  FFFF800010B3B464
>>> X15  FFFF800011192048  PC   FFFF8000100D9F78
>>> --------------------------------------------
>>> CPSR     80000085   N N  I I  SS  _
>>> EL1h                Z _  F _  IL  _
>>> nsec                C _  A _
>>>                     V _  D _
>>> --------------------------------------------
>>> Current ELx:           SP   FFFF80001130BC40
>>>                        ELR                 0
>>>                        SPSR         20000085
>>> --------------------------------------------
>>> EL0:                   EL1:
>>> SP   FFFF800011182A40  SP   FFFF80001130BC40
>>>                        ELR                 0
>>>                        SPSR         20000085
>>>
>>> EL2:                   EL3:
>>> SP   0000FF0000011000  SP           4400A500
>>> ELR  FFFF8000104CC8A8  ELR  0000FFFFC02064AC
>>> SPSR         20000085  SPSR         200003C9
>>> --------------------------------------------
>>> SPSR_ABT            0  SPSR_SVC     20000085
>>> SPSR_IRQ            0  SPSR_HYP     20000085
>>> SPSR_FIQ            0
>>> SPSR_UND            0  ELR_HYP      104CC8A8
>>>
>>>
>>> Above is the CPU state, when the kernel freezes. Any hints on what
>>> might have happened?
>>
>> Can you correlate the PC value with the hypervisor disassembly? Or are
>> we actually back in Linux? Current SP == EL1 SP...
>>
>> If that should be the case, you could use the JTAG to "trace" how far
>> you get: Add an infinite loop at some point the setup should get along,
>> and then check with the debugger if PC points to that address and if EL2
>> is active. With that, you could also check if the UART print-out is
>> executed.
>>
> After tracing back I see it's looping infinitely somewhere in the
> hypervisor.o file, below is the code where it repeatedly loops.
>
>     ffffc0209550:    b9400680     ldr    w0, [x20, #4]
>     ffffc0209554:    b9403481     ldr    w1, [x4, #52]
>     ffffc0209558:    6b00003f     cmp    w1, w0
>     ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
>     .....
>     ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
>
> I haven't managed to find where exactly in the C file this is
> happening yet. Any thoughts on what could be happening?
>

That's very likely

while (entered_cpus < hypervisor_header.online_cpus)
	cpu_relax();

Did you configure more CPUs than there are in the system?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dd337a1c-d678-7c7b-d371-f8bd2b019c28%40web.de.
