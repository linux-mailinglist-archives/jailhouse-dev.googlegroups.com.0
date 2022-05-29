Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRPAZSKAMGQEPO6IWMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842B53705A
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 10:35:18 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id l15-20020a05600c1d0f00b003973901d3b4sf3789304wms.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 01:35:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653813318; cv=pass;
        d=google.com; s=arc-20160816;
        b=yzCg5njA0Een4tfSC/EdHh4kSSh1G0rkkqJnVeDhBq++qDNRt55ZoGozG5/V+bAuGt
         r5SZOidClo719XB/utxeMf4TNcpY0uxrwDhpp6C57zHu6OrlO+xVLCAO4gNQdP8ot+rB
         nInBogUcmQVRrfil4mti9gUgssXKM5kKoViyczc4l73LSJtI6a79Z4i/++xhQGUuTjk9
         wHxEAJHJMYbfcRfn0Lt6mTEVT0xsvO+rVsgVs0NqBC8n4SacMYJMsK69rlUd7kHyjhFh
         JqFbyHWXQESgclvouid5X0tniems3Y+5Lf+BI53JbiuZ0S5DAwq+/72/5l4n4vCEKXac
         9u1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=R9vaiYc7r+1UbKfsRs8MECVFdRN758DHulhbct5poK4=;
        b=SNdD0TT80lV4VzjKVkp1h9b52JHlFs4/7TjZ/O5nnTF/L4QwBVzgAvs/NEYvElp0hn
         ZFiiiXPkPSHciFOI4IY/UkXqytHO2s4ZZZ/srheg7P3N618VKsD1Ejf7brRkpMCdl1IU
         g7WnNAVg/hFFfgl2BAtpjm6lP6NSrLi9XmdgG+tCircCMf+g4agOiEMUJ/4T6xJLpmBi
         hElUlGt00Hk5TCa0vUDEA8BFnesyHLnWhL06oFq8AK3oZLWa3es0PP59zcL8byaWnYl8
         AZvuXUlm4l1Rx83aP8FcHC7RyoSVW1DaDW5O4q3OWb5zW4AeBCEOMgH9LCBh+7TJAhlT
         wu5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DorZ0Ksi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R9vaiYc7r+1UbKfsRs8MECVFdRN758DHulhbct5poK4=;
        b=f39+aZgg5wR3J0ESjY6hFDatThVIQYAbCxzM39gExhe+2+8qBbbCLZ4ulWPUsuQ5Og
         LQPTcWD1z0sPhEQcUZ8vsyVPQ3ej2GQ4vlJpfPHj4IzKWHSPDiq5p18gykW0dSuPrGT6
         bOyGNWMsfkvRYyYTR9vcf9ihqPvFN8z1Tiy152dhkiBCHTwEpR1iaZYdRDZ2fwnuFrLn
         QIPbuI3VTUP1irAv5HZSBM5UCfm1SBVxcgSvv+A86RulRMKt6LhuSDKTdNG/K7R2dOXY
         qWCvV1NGjRzCm5arWpw8tHtFqJLTIIYJNfqhSI//U0v1qdDpPQfxldDFxhk+DI3LfVk+
         Dsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=R9vaiYc7r+1UbKfsRs8MECVFdRN758DHulhbct5poK4=;
        b=0BD6yRzmuF/EuC0FKTewLncZgSo5+fClACcpQE6Y+3288ki0meAYmr21Feft1GwmPB
         FlTRKsrAM1suoUzVKg6zahLfUGrWEb87zoeHtBibAud2LUi29S9Azp71Oyr4f4JllM0E
         OScDVPg7sZU11XYiFZei+Ll/xWYovbUtUj4NzdZQmwcnLcmIB1AehD4mDQ826SGqBvSk
         HdwujR4PaGJeW70HBQbV/wDnx4+/NVPp7hoN08ANhtO7qvoIRhcUo04sZs9eVT8L4gt8
         305WQFegrI9kkwfyFnQPf9Xu0bNV8n6m4MamrtBjhuOr6guv/OAzrcJOrKboHjVk1RWs
         cP5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530znkd/ZzOWXQqjWNXInsu09185MQb1Jis5cnEOVv9ZSPBaiP0b
	MzjATgPlSV7Zeh3uhQlVBT8=
X-Google-Smtp-Source: ABdhPJyjP3n9B7x3D3WpKpPkpvp0za+r5vDjuBHO2D2CRLGqdqL+u1BkwMWW2xLuWwpI+jjwA/SFgw==
X-Received: by 2002:a05:600c:3511:b0:397:ed1d:6c0a with SMTP id h17-20020a05600c351100b00397ed1d6c0amr8284355wmq.191.1653813317776;
        Sun, 29 May 2022 01:35:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b8f:b0:397:5d90:f3d2 with SMTP id
 n15-20020a05600c3b8f00b003975d90f3d2ls7275423wms.2.gmail; Sun, 29 May 2022
 01:35:16 -0700 (PDT)
X-Received: by 2002:a05:600c:1ca5:b0:39b:a66b:7805 with SMTP id k37-20020a05600c1ca500b0039ba66b7805mr1267592wms.87.1653813316455;
        Sun, 29 May 2022 01:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653813316; cv=none;
        d=google.com; s=arc-20160816;
        b=tcdpa7O7xQOXHWxVcIC8wAps5HgUA2ouenP5HUxVBk0FWgAmPbZFa7pRQaqeD/xxKy
         kfPC7A5SaTXhC2uiExtEPXNKEFwHxKNssmymFdt3ICNfI/T91I3xBqON6ImSqi22ZGs+
         h9p/IPLA04rAWcoVFYI/eck90RF22O89+RGwutCeFyIqc+T2b/Hozg71EEkDVhJ9zOTn
         SgqGoyKxgE8YI4d/TiKp4qBF3kyoT5cc8pkJML4OWOqoRac45A5APJibwF/Y5iGqOmq7
         H6Sfv18iFq8S88TUrmZsz3wIwYi8fn8malkL5U3tVURpv7TP7R9V3midaZ4aso2ADg5s
         P5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9JZ+LbB4Xo64SJeS8cXxUyzB1+wUKaD8DOBEmZqThnk=;
        b=OrcPTmU8vEkoW16jZeKWSN7I8BbIvMdX3MiMx/NZrMKGE+tZfa72fviyiJVPKfDsl7
         WjGNbl3fVrNPQVECuhF/lEWTznikPEwX9AkGLspRmWiNYJMoDVXsbNew0Fnwq2eLjMe/
         7rD2cg31RDv8Wpzqybuh4yDi9L7mTbL8x950nBAOyWRoW5mapi2FBZVHwCnKc2qSV1hw
         Sj1L6v7iG2SesuGcuDkHJ9+dQjzt3wd3vz5VdDqAvKVJ97CKGkuDS1f1NpD0xBrj1+aU
         NswgvX+nFlltBL9IZe/0H6GRLqpn5/CFT+JGiyhD1Xz+t2AjGoOniuZA2chqeLWMmU9M
         aAIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DorZ0Ksi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o2-20020a05600c4fc200b00397320af7e9si314997wmq.4.2022.05.29.01.35.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 01:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.112.125.132] ([193.96.224.57]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MovjQ-1nTHi91WU2-00qc7H; Sun, 29
 May 2022 10:35:15 +0200
Message-ID: <1a407933-180e-48fa-760c-1c90e159eb2f@web.de>
Date: Sun, 29 May 2022 10:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
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
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de>
 <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:l1YZ2MApVq4a3yeJmHEjw5zBOB+qgRX0AR+YHYhk6OweXiBBuHP
 L+5ktSNA7i4z/qT3etxmVmVExudgjVjbZUML3Fh80qNeevgotf4+QjYQ3+xEbv5RDlRH7Hl
 pNR4EReqvoNd5tNpGBjFW4OSO5SgJLlyTr4WQZP+WJhrkhjA6AOjoegzzxY2OHfhxk5uQuD
 SOXxRS4C3XIo/LNOMbPIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GAYnFl/n/i0=:2NqciT9Q/8L9iSw3YN3U1m
 sqVMXij+Yx3nBZ0j0u+/nDUN4m9Zc6Mt2VpmybsmmQ4e4P37XI9po0lvcb3AAVNgeLuoPGFRh
 0j1hnYhBhZuiBO1SsOMs/tnzpdg2rrB97BhLrzYzNK/zUmLnsmFkRZpSHx2AB+ERKy70bOfJW
 TBV5WHI11xaWA5gzA3kYp3lZ6we+XVoRk7rkuEUdxfjDeemzQTQr6cU285tj4agEkJo0nxY99
 FADF9X54YtIUAziWBPBVPvIoCy5it5XFSAkYcSs9qYFfHwLzsQjCzjWA9jhMY9nxPob4rhH2w
 +T02x8cSdzG7wJEDJX6gJtd1O4V211ov1wd0frWgr+6uFszSX31QPpzRET9SJtpWMzzifBvh0
 2qmRUCZvBxHy5m6CAlaY8HqBcVSWp8yw52O8dYUxgLoYuoN1PPuddOIKfNx/pvljXFP6TU9wv
 TLVc9CUP5lX1k+vGsU1t2+RH7QC11m7FbwD9DLtlsLshfDEv3CxOFchWFpDW47klDSHOHbZDn
 5sy+zIW4uRFgEqHlw/JqIOZCZf1UHLxxvJX8UWlNMTUpLE1+/wFsjToTOB19gQrg5jseLTPeC
 7TXUuGtgXToTrHWTZZF1m7xFHLbVoyV/T+TQsCSccDFSG4Vo9idOeczrqwiPf4WqWGZOmry+g
 p5cW7CI80Bq9fqQcvTbHenEmnIseqFC73NYqkYP5F/biq1y/sAwXC6n3QPNO7LwzviMgzM0L5
 eVH3puUxzR2R5DT7o5fjxnauiHg6v+pdBdpEWwcoEJ56FTj0yL7xEDNCeypS+kcvIPn/5Yb6t
 Vzbt+dVnKBpAjEm9a+j8BI0IXUrMLqgF/Z74ZamQlm0jAjLSp2F3n9gsx1dY6OpizpI3OZSbD
 z6yR6W6CI7vfoBtY2JEdKh7xvRaD54AcKszcHAJN/fv9c5siwmWvdqawP2vlAn4LUYpiyIkRF
 dHG+9JbO5HizuZbpSssF56nfDSwKcYhhjVhaLXlmQpQlSRzjmLHJjrHVI4eR/P5qwzYvvvbXv
 vDVN6nF6lsy1TGQEud8Ysw6LahQwHhbri603esIIT1glFHZxNUmCgsP6CNpB4wmVqukUqZZAW
 LqsbG+5/s3XiGF1N8lvkweBKqf5caLukPaHImp7Ee+H8W7p5U9ycWwHXA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=DorZ0Ksi;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
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

On 28.05.22 21:13, Lad, Prabhakar wrote:
> Hi Jan,
>
> On Sat, May 28, 2022 at 3:41 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> On 28.05.22 15:22, Lad, Prabhakar wrote:
>>> On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> If that should be the case, you could use the JTAG to "trace" how far
>>>> you get: Add an infinite loop at some point the setup should get along,
>>>> and then check with the debugger if PC points to that address and if EL2
>>>> is active. With that, you could also check if the UART print-out is
>>>> executed.
>>>>
>>> After tracing back I see it's looping infinitely somewhere in the
>>> hypervisor.o file, below is the code where it repeatedly loops.
>>>
>>>     ffffc0209550:    b9400680     ldr    w0, [x20, #4]
>>>     ffffc0209554:    b9403481     ldr    w1, [x4, #52]
>>>     ffffc0209558:    6b00003f     cmp    w1, w0
>>>     ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
>>>     .....
>>>     ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
>>>
>>> I haven't managed to find where exactly in the C file this is
>>> happening yet. Any thoughts on what could be happening?
>>>
>>
>> That's very likely
>>
>> while (entered_cpus < hypervisor_header.online_cpus)
>>         cpu_relax();
>>
> Thanks for the pointer really appreciated.
>
>> Did you configure more CPUs than there are in the system?
>>
> No I haven't, I've set it up as cpus = 0x3f for 6 CPUs (2xa57 +
> 4xa53). I don't know what was happening there when I removed the
> infinite loop (which I used for break point) from entry.S that went
> OK. There was also an issue with the debug uart driver which I've
> fixed and able to get the prints now.
>
> So now moving forward I am seeing "Unhandled data read"!
>
> Looking at the address for Unhandled data read one belongs to GIC
> (0xf102f00c) and the other one belongs to the debug uart (0xe6e88008).

Regarding GICC access: Try setting gicc_base to 0xf102f000 in the root
cell config.

Regarding the UART: Do you pass that address through to the root cell as
well? It's generally fine to allow both hypervisor and one cell to
access the UART in parallel. Otherwise, disable UART usage by the root
cell prior to enabling Jailhouse.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a407933-180e-48fa-760c-1c90e159eb2f%40web.de.
