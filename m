Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBC7PZWKAMGQEYUSKUWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB8537127
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 15:39:24 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id c125-20020a1c3583000000b003978decffedsf3928634wma.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 06:39:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653831564; cv=pass;
        d=google.com; s=arc-20160816;
        b=EmrMt5AYZZ2pWqAkfRIvgWjMzJCgXwMtlXQ0vIUVPcUHiSs6A7zX/w7PJYEybBY38n
         DjcKOAddZzaG4WN7Px+YWYuDOeK8qIM3nvLfKkfnJyqbKkCkEwX4l4rtKxPpKNd5KIcg
         NnFHAfpN38KygR+14qsKgraCK74/Pa6t7zuEjkTE8v3yVIK4fFxV5CCd2ooNzLU1tPpG
         S6ZC/UVc/FR1DEJspu3O7Di83sJrR32NlvwaZlBN+9ThvZl4DFmuNy6w09fUrAcWJd5q
         GPr+SKLjPMHbg68oAzKEJ+cbCYWLk1IkBCMv7wAOm27us11g2sKrgEOkBLkp8ytlvfcJ
         MR+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Mmu8Q4KPFezK0tWT83GutkwOPdNm5yePeQcYJRJBY88=;
        b=A2pY16DZbdMQZ0puSQ6r6jzWoJrh+dBPlrl2d3epNLpe47ThC4UPL8boVoZoY824Rq
         FyzIrY7LCR606qmZBwMYS5Wjg8Y4eNIARf/G8nzE7HfjU+R1S0mZrJlqWGbz/+uosg0T
         2/59ekyD9V3jBymfPIYLzL6jMQy4MeCpWZf7EUwjeSyikf7/zW2e1HgeGBMrbxHr8miD
         ieOaqGcam/WSi7i9cw8W3KkFDcB7PkIeK4SFyExaQriZOatf85tnzF9qj7c27lEIbpaX
         vKlJn3oBab/AEe6AGZembqk3IEfVEjH6/rD290Lx72RP3tFIgsyXOHhn6PIHEkSKOSFI
         gA/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=da3kbtC1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mmu8Q4KPFezK0tWT83GutkwOPdNm5yePeQcYJRJBY88=;
        b=RIYE7Er4uIF+M8EFHpQsiapTWQTDpIcdLb4eBCGhJzyKXAoHSk2PKPD2X8w+pS57ph
         O14kJmwIxdfpTJCMU4uhCZXvnRmvbe7vK2cRkUgcaBQbMBfI3R9ak8LQXSHvc4Sc3Yeq
         ugVvZaUuSB/XPVkIagSvWOFMuMcWiVMGWEmAxwLM47Nm43utb7QJDNQE9V7x4tFnBaR7
         Vd1Zbem8lzl9DhVHYa6wjMAs1VjZ0RjOzASAy4pzAvcqfCgk7Cogt8UPe6g3276hUSuO
         5wfKOkNofC7f9LpbdNwFpchcHwswYdZ7Gjxh1VJf8C50R3M5Eo9uzrCHKJbg9jSugVer
         /ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Mmu8Q4KPFezK0tWT83GutkwOPdNm5yePeQcYJRJBY88=;
        b=TwssWYNQBq6/0jfQWABO14lg3aCOUmI1X2DuH12+MEsm7gM6G9qqSruHmQndZ7WdNA
         TLOmuumSmj4lDW4caE+uKufLX2ggeXx2pX/jlBs6RMsD44Z5jRho6O8/oQ5DjZLiLdh6
         7bw9iUyZ4qzI5pz3k4qJnNin5KES37DwVMySfMF1Ng0bOID35Q+Hgdyh0t7GRCgjQSZP
         +ofjAw9cP/YrnyjPlBx8xnkbnc0j5a8BiEEF4poqjkdx8s7nmKVLSBjzl+o/p0Ve4kP0
         x5uxPC3tj8ms6Rmt+jpMG7f33ZCnuQFo87ngoY6BJK+3GFpKhbkUKjtnKCkEz6aNa3e2
         ghQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FJ0+MkAzYR8gLP+IRuafJ8efsTq+9HT9NUjW1vxCzUqPt4Xwa
	14PeawDhYx9f6IVob9DfI60=
X-Google-Smtp-Source: ABdhPJxb2GQT4SuMEjWphEhbQnGiJpRQota9SHRDuY7obk1ZwIKLrm91wliV/uQQve53dhLiVC5lzg==
X-Received: by 2002:a05:600c:17c3:b0:397:8ee9:cb66 with SMTP id y3-20020a05600c17c300b003978ee9cb66mr9917470wmo.91.1653831564458;
        Sun, 29 May 2022 06:39:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e1a:0:b0:39b:6b:f2fe with SMTP id g26-20020a1c4e1a000000b0039b006bf2fels836355wmh.2.canary-gmail;
 Sun, 29 May 2022 06:39:23 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed4:b0:39a:de6b:40e4 with SMTP id g20-20020a05600c4ed400b0039ade6b40e4mr4345645wmq.100.1653831563142;
        Sun, 29 May 2022 06:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653831563; cv=none;
        d=google.com; s=arc-20160816;
        b=rNvBDMFAohEPCBOSDt0W56cAhDHzLdiUuxYoi8PnDvyhn658ilEFCw1bEmcZCjhmtf
         zhL3rGyziA1EluaCn7dkzhl2dlNdMgRKUx2jpnQbG1ZfvpeQs4sA0N8Ly2MDmip1Ac/R
         6MANqm+nJrtR2uoXBhz6OYP4aMCCbmPprZc+nqgTMgeTQiuY6I8neUpl5zglPNMO3BZ8
         kWKDF7RF1zg8PnoHkPUP5ysATHDTnmr1nSR7RBvtKPCRVnPmfxaLpdx9wQo2oNTyjQ0C
         lI6XgXkds2d8p7lF6JxtS4qNfXMV6l4v/opqdghNPY7I3BZRA6JilfaayyBDjSZ46CHC
         BVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JMd41+UF8SzsJhdH6/REZkAqCxHZtnKairW+BX775v8=;
        b=aWU9OzDwREfK9KwYCofo5TNaDGrFGip/dcOGfzrR77VCSMtEePXLFH7cmsccVhYZWu
         g9D4TfjRUi6wIOOw0heFdBCtOqK1Wrbdebg3TysW0U4SbpWLlfDZ1kiDosjXLwqKs/nd
         mm+XJAI/Fa4wPX1jofFHsRPUtSZTVYlPprh6CLqv4cQVirIDNyh1Ki0YxAnXpCoh4cx/
         3tkqw4D9NSnjQOUOj+AimWni8F0feEvZ5UwQT1qnm5WY4IBtfZfC+UhTvxRP+3tV/RAf
         K4wVHhdPZnu4MLDBboK0HrfVB8dzxcToEL8UbWJMlum/7ypd8ctLk02zhI1kidhzaYtA
         HXNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=da3kbtC1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id e13-20020a5d530d000000b002102a7531cesi114249wrv.2.2022.05.29.06.39.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 06:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([88.215.102.122]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqIFD-1nPlcY3HEZ-00nIOe; Sun, 29
 May 2022 15:39:22 +0200
Message-ID: <69a0ae1d-1ee9-e99b-f190-d534ce86c227@web.de>
Date: Sun, 29 May 2022 15:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
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
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de>
 <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
 <1a407933-180e-48fa-760c-1c90e159eb2f@web.de>
 <CA+V-a8sFJc+uFp+n6G+fUFNX1u6oDwbG4Ge=+2yrhoh8FQ-UfQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <CA+V-a8sFJc+uFp+n6G+fUFNX1u6oDwbG4Ge=+2yrhoh8FQ-UfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tD/t4y+0gvDe4v8T8ZZehq6cEoUhGVirXdj7FE0vV4OZihRiq/I
 AymCF1k4roSB5KTm+Y1GhRdp8yjzO1ngRG78B1OXCWT9J++hjpV40NOiiYFI35fnZAUVKLG
 Kb/DIJe+DoEs3gbovi7tCeyoDRZW6Dvq0Ws4h/GdLuUuzLyLzb+/WLmd2G1INgJcVb6FZP9
 BULkGuTrkMWqT+v2+pj8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PPsONicG2M4=:iNWh1dvqxECGsB8zave/aC
 K4E6nUqLWlo/n2+HlEFX1Ls8TBCyp0ZpvoHhn28eGMyx2EsEXBNPUVhtcDZJkf3lB5dWepigQ
 TzBr35cAkCt3mDsKlhMPVSNtwnavJ5l6wkVBNfyTU5CSBvX6mA4hUaRlql39EP5T1/+eucAx7
 LqnJyI3LPoCMY85HPMrhJqZpRG2IHDUh7AfikmR7MjH8A5JyjqvN0X/sGeehuUG0/x1YaJwO3
 t6EVocqcRWGf0qEMRSHhO8cZ8drGV2kV8VgbSgvMaldXi4XNNLHFwfGyWEtOFpo1+UN9dRTse
 igxhev0Cex5MyfN4wtg6wFK8amKOvUcDGSHUO85rNAqp18wZ6KG1WPw5IlDDZPd7vslpaca/5
 +NUR9Ks1WVKYrXxQF1T9EY+4EuokBpYKLI1v2c1kNPnR1jlJuKk742j0l1mMR/EMk2xzg3Mmt
 lYapsE/awuBEL5qX2q97B+qHp/ysvCyim6KTXxc6FtqpaygvLI+1vmgp5EROJfLML0IG1nZoT
 hbxpOSl+9HTDBJsybeORAbspH3vUBq2HQ1NVO3RPKIpBHF5pfloUgHpSxl9zi97ObOgrnuRkR
 HT/K84PmLSt4V+xlSmk+10k10woo03VO84emo1sBMmUV4kMOwG3ON4u3FpEHTcZAk27mnYUeF
 EJqKk743ZU60wsh1EsK0sO92LpMdNYm96PpdnbZe6VtJgP9CG7S8CMvlKuCvRvZfgz/cuNKdq
 Re4i3dDF3HbjyOUeI9Cjca2ZKF+QQiKvCNrIPNM2fdhjpngt0vcpL9m9uIyspVajYTtd+I0fK
 3iftHNik1ysE6nyXcLbB0dRnDTUOXn/FOKkXJQgphVbMMkAawGPj50KdKDcY8XlQ22lXK4b26
 3Dv9ZXckCSeAX31rxbfPLslcFVHs6kRTrB9nuSrwoZkI3DFvSyRfWZq0ZWyDHSxecgFJj3gK7
 zeUq7+nEkItdd72VZaLmKcp1lnbu1zKIwSWE9ISyLUtnBILt9Sbin9Zy5FpzZNOUJyTAyZ7hK
 S+YapiR5/PgMnksYg8/KMnGzyIB6FgyNY1+LBgdHbPLConzkH7GrGpORY/I/v+MgVVTat+uuM
 g8Eg7cPesx0nUJkuXfGPFNIbOoBFgyCNiLlV8i55rfeDppU7EBYUuwS2A==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=da3kbtC1;       spf=pass
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

On 29.05.22 12:53, Lad, Prabhakar wrote:
> Hi Jan,
>
> On Sun, May 29, 2022 at 9:35 AM Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> On 28.05.22 21:13, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Sat, May 28, 2022 at 3:41 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>>>
>>>> On 28.05.22 15:22, Lad, Prabhakar wrote:
>>>>> On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> If that should be the case, you could use the JTAG to "trace" how far
>>>>>> you get: Add an infinite loop at some point the setup should get along,
>>>>>> and then check with the debugger if PC points to that address and if EL2
>>>>>> is active. With that, you could also check if the UART print-out is
>>>>>> executed.
>>>>>>
>>>>> After tracing back I see it's looping infinitely somewhere in the
>>>>> hypervisor.o file, below is the code where it repeatedly loops.
>>>>>
>>>>>     ffffc0209550:    b9400680     ldr    w0, [x20, #4]
>>>>>     ffffc0209554:    b9403481     ldr    w1, [x4, #52]
>>>>>     ffffc0209558:    6b00003f     cmp    w1, w0
>>>>>     ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
>>>>>     .....
>>>>>     ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
>>>>>
>>>>> I haven't managed to find where exactly in the C file this is
>>>>> happening yet. Any thoughts on what could be happening?
>>>>>
>>>>
>>>> That's very likely
>>>>
>>>> while (entered_cpus < hypervisor_header.online_cpus)
>>>>         cpu_relax();
>>>>
>>> Thanks for the pointer really appreciated.
>>>
>>>> Did you configure more CPUs than there are in the system?
>>>>
>>> No I haven't, I've set it up as cpus = 0x3f for 6 CPUs (2xa57 +
>>> 4xa53). I don't know what was happening there when I removed the
>>> infinite loop (which I used for break point) from entry.S that went
>>> OK. There was also an issue with the debug uart driver which I've
>>> fixed and able to get the prints now.
>>>
>>> So now moving forward I am seeing "Unhandled data read"!
>>>
>>> Looking at the address for Unhandled data read one belongs to GIC
>>> (0xf102f00c) and the other one belongs to the debug uart (0xe6e88008).
>>
>> Regarding GICC access: Try setting gicc_base to 0xf102f000 in the root
>> cell config.
>>
> Setting gicc_base to 0xf102f000 has solved the issue, I no longer get
> unhandled data reads now.
>
>> Regarding the UART: Do you pass that address through to the root cell as
>> well? It's generally fine to allow both hypervisor and one cell to
>> access the UART in parallel. Otherwise, disable UART usage by the root
>> cell prior to enabling Jailhouse.
>>
> No, I don't pass the UART address to the root cell as part of
> mem_regions. I just have it as part of the header config as below:
>
>         .debug_console = {
>             .address = 0xe6e88000,
>             .size = 0x40,
>             .type = JAILHOUSE_CON_TYPE_SCIFA,
>             .flags = JAILHOUSE_CON_ACCESS_MMIO |
>                  JAILHOUSE_CON_REGDIST_4,
>         },
>
> By disabling the UART usage by the root cell did you mean to use
> JAILHOUSE_CON_TYPE_NONE? I tried adding JAILHOUSE_CON_TYPE_NONE but I

No, I meant

 - stop using the UART as kernel console
 - stop running a getty on the UART (the latter happens automatically
   with systemd when doing the former)

> don't get anything on the console after enabling the root cell. I even
> tried removing the entire debug_console{} from the root cell config
> but still I don't see any output on console.
>
> If I update the size to 0x1000 as below and also include it as part of
> mem_regions, I get to a state where I see the message "The Jailhouse
> is opening" but the console seems to be frozen.

Sorry, I missed one bit in the gic configuration pattern on some arm64
targets (scan configs/arm64): you also need to set gicv_base to
0xf106f000, then it will work (crossing fingers...).

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69a0ae1d-1ee9-e99b-f190-d534ce86c227%40web.de.
