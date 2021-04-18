Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJUA6KBQMGQEDPEWQRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6DB363735
	for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Apr 2021 20:53:26 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id 93-20020adf80e60000b0290106fab45006sf3258625wrl.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Apr 2021 11:53:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618772006; cv=pass;
        d=google.com; s=arc-20160816;
        b=gCvzmH6w0ABNa+AScZAwUlia96fJz+bgCNnofjZiy+9PUTPTGD0GOwlJVsLDkmMDHt
         EfrqWfmwao82FkeCSOQuckpJZ39r9ePwDqcxpjCCIHWASaQNpuZvyuiFOHd+znssXtE3
         Jln0GICEj4VMAybl3+pPC+QR38wA0eXB8FvLRtYjT45ITYfqZoySIFgsIL/qYF5Q5SIH
         I6aE0ag5DfYyxqLIVAkgUN1j94R5S0S/T0xyG4HfH9zzGolyfM6vB++1KJTdYunH5+s8
         lxQEOH/rE6P/dLrWbqL1HP+5stWYQO6kwgrO6ANTZ9IaAKn/TcD87GN6xPsc+2fFGhw4
         qYLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=hF3ET1CrogdOtHwIg0mbEDE/+xtN8Fjdmj7BialERJc=;
        b=iAsg/hoJ7PRkkhXlgEBsNlCN9HRhysyez22yKYGLKk/6rLduBvxVALLuF6E4Vmj3Ug
         5zVLgsjBwKJGakTUyeupN8gswAcO1UOgnoLsPf3CrWhCN0F8lQes/lukDQz3mY18i+oX
         p/IrJfeuvDGp39JXxAmkwUExfCYGEmPbJSLPhYp8OrEbwHpZtPZ1ssph1x7AsqUvE92t
         itQbTys66EJmcrYi2HxYG4R2CZawM5GnLsRLC4L5xXee1S3xSPJ3m5babSKELAf0FCbN
         LJGIfZghq3nBVyju4O1AiHDcQkwVVkNTGxrD+vQ+bAAUGga08Mlc6vzNMXkWxPccz9yY
         zW8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o9d0IaOM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hF3ET1CrogdOtHwIg0mbEDE/+xtN8Fjdmj7BialERJc=;
        b=ScL6UoXv0GPtKzTXEy62ZC+b/MRIJoYCOMKFp45SK6aP0us4n1lRW92w+ptYXM8/Be
         LgKODYBrAh0HF4J//qL/IcuM+MJsTZTR5HP7hUpiFS9NCRxYNeZl4rr5nqbgFoTpCGCE
         4GpiLoluiNczAM6xyS+bG07XwudMBmh/ehOx2AvPwXJpn9K+OOGgdc8DWLtX0aCKKNv9
         w9LsHStpqeqFalaIXDFRQDwGlMs+Mfh98WitPL4q2dgvOrElMIsAvr9aRfU3ZEGkLzVT
         oVjnvjIlyrhqwbOZ+kIrNEtNFyzkU7YdlzgyOx1LCXe7pSpZ8m3+Om1hUhs+aqmX+Wnc
         NWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hF3ET1CrogdOtHwIg0mbEDE/+xtN8Fjdmj7BialERJc=;
        b=rBYg0Jyzyl9UH0U6Vb7CN+ap4d11NEDgTBPecGSDGyoN5LhCI9wGOfkPWSqTacEULI
         X2GVCQO0GnkuFCg+TwWSYB2Q4U3gG8i2sT14wAqyiQvipS6rv5m0cE8taNrTAZYumebA
         S+2g1HAv3lhkUDNoQZnSdYN0JY99Rqbz0ijGSGsIve7dYmdPM7S/eB6vUytaAoE0ZBHB
         FnqRkhwofvr2mMD3lt0fwMm/CbS0IWx5bcryzAip5nqhOdnbLTq1+TalMC6krLWeKluE
         xjFJ8JXjH4N1eTzBf3MNCAxKNobjnKyfUQXidiZzR/j/ON32Ml4iSb7p7nRQ3aUhqcwj
         1RVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532TokDZNtukxzoNOjiumHb8eYbQA4XZldvWjO52g6Pv/ifNnEmt
	TIBJESNZZ1lcPL9fUFpvVnc=
X-Google-Smtp-Source: ABdhPJyDPO6YypW/V3h+M9xzfE1/u4xboW6cB+lixSEmRc5wHiLq/sZkTO4B1waLG3MepmsHm7+/5A==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr10543181wrv.41.1618772006659;
        Sun, 18 Apr 2021 11:53:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4101:: with SMTP id j1ls6760447wmi.2.canary-gmail;
 Sun, 18 Apr 2021 11:53:25 -0700 (PDT)
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr17338407wmb.9.1618772005633;
        Sun, 18 Apr 2021 11:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618772005; cv=none;
        d=google.com; s=arc-20160816;
        b=XYnritduLJ3jmERnhaMo+1YiVPH2i3bmQc8epuPLgifCWzO3moUWChlk3dfQoCZ1b9
         aBWJoEjbRf8nF+nxIdke5VrUGa9Xe0Y7YLvoglzjtJQA4Nbi/bg9rV2eiZvkcEMi7drz
         +CcHAnqthVKAncmnUf+zCs9OiPHMEqtOl9Pi73Ao+hTqBoyxb8K8Dp7g//ITuyXdAePX
         Ib9OnScRAzA8Rv+j+DZmBK4DpjcFmNhF/txblN7Ijk0YXUHv8hD/wa1XZjqgi50c1jHL
         FMyNTQkDQpjNXhOugT4o29ObYF37aFh8lwvYvKVtCV+Mc/oCfbuTxY9yhngCoqzHtC9d
         Ge/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EFtoXD3+wY/6RIDIbGzrtEjCgw8FmApaCjSrWYIwPNk=;
        b=nT24XKk2adne2p/T35PkyWcMD1EtnNt56pThU18kj0RXXo5sfH+2T9AJDiDXzubPc8
         x9Pe9pw4idCSuTaeIfiuQkhIqgb/pocGVG8YZ+yi8U9BdIaf0nzyD6C01+rF72IgdnnN
         hdtjjdgTuNlZOTEo1Snlggze3facYXt27vLFpkdWQKmtlfR6V8rHL2vUlcF6sNGVEofh
         nnkVecBULdlAl+6YiFw6sPjBj5yaHxzpThlA870gBsoKPjX+E+AnWsU8gJnOjRp0cjzi
         vLtf28Gyh2D0Iw78dRiyY2RT6gmOk8OznFT1X7iDAgkKISzp91invmJdBioVjWQt/V8O
         W70w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o9d0IaOM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id p65si1044199wmp.0.2021.04.18.11.53.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 11:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKJAE-1lXeqY11XC-001k0j; Sun, 18
 Apr 2021 20:53:24 +0200
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
 Marco Solieri <marco.solieri@unimore.it>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com>
 <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
 <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com>
 <CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw@mail.gmail.com>
 <90b4e3c5-4841-0699-7601-f455e569c84b@siemens.com>
 <CADiTV-2pfQ4SVayR2A_3+ogF7T743RjM+W7R0hQFNu=NG5c5wA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <2d9bf4f2-0c6f-525d-1da8-e5ccd276394f@web.de>
Date: Sun, 18 Apr 2021 20:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-2pfQ4SVayR2A_3+ogF7T743RjM+W7R0hQFNu=NG5c5wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:MBQhX5sU422t3NyWXOAwfBJQthWoFRCvids7KcJBZg5kpx1NYbN
 oVoMmYqOdjDEPeG4mm4TeUyucSiqeUf2hmrOHxqmo3iAEFQRYGeQOoW/MbA8fGUvbk/0eEh
 VB9fb59t68ezdRamkHXZeEZj3inZL2RCDFN/kwKW56KmG30TW2Kr7w2XbrrAlJLJf68RD3g
 2ay1u6LK/i0Hw0THeHAGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5vZkZ8z/NNk=:cGkypKWkdOFVMxcbhUcJWA
 hkEkoamGGqXy+GV36R515fAYdxsDmYZhmT5lMgNmfOvi/lbg/wBTrGGJYx3LD15RkW+PkBd4d
 u3nLAl4ikI3LOGDD256SBrZFQpn5SD16s8RSckQ5ylk+oDcw9v7VKToRlKto8OAs0b/1XXyIf
 YCXb8sv/FNlbvBXy9MAX/lcA6eukuHME6J8RcNYal/LA8Xte7bl0EVnNCAhy2sRzuwLbwmu97
 EJmIZR0p8AEPoGJTrZI1SDcUXLp/o5QbrmIw7oTgP9hHT6a9g+4cT0gMQICd/BmIAfIFLrvT1
 ujxW5shf05SIOK1gj0Hhu2HB354kthr5i6nbYR+zTUAMHE2cYVWgLkX7afazgA26dtsrtZlOe
 9T2XIFxasUFy++Fl0IO1wfCRdyZP4n0rTYSttii0O2s+MsUfdYCSMl/u6hYgCNECaPq/JRLuT
 trB+Yuu+hcWZUzDBStCV3zmr1cGSuoCC+s5ct8F37oEO6eNkGHlBmc+FmajNer28AsFRjjUAP
 MwxVj7aOCxZoW9Rpemz4pRBt/H5xtSNa9j9FBJw4gasSKpAaxv/rIo+iwkwpeQYvnozwUPa5m
 glC8tIHlH6dSN0cWB1O6ftEhkbQF2pMuEu5kJLUTdoD31QEdTT8XF62RVZDZOuC1dNkWoXmXs
 HNQsyPEIrz+KCY3jOqibpibVLDWqSm5DHxY3NyMFPjVBujSPXB4tP0ylR9DzjV8xovSgVvS3R
 H7EZuYF1wzrzPp/x+NPCKz9V5mwnNZby+MJ9oGFjQUpyNA2GTAAD6wvzklMEY2hWj3qt+ru9J
 8G8Z7gQ+mY/fpeBwrKJwRxyhD8t1s+qKsMV2YzKWUnyNWVLktrPKC1Vtikqx8vPDEXF5BFl6q
 XRYhm2GJwDUy79HKAQx38/BO25CCSSiRmCJsRAay1rOC+AXdCcD5NbkFLqsh0WcNMD1gA4syi
 js5WVspniFESbV5Xw4blbaxOqdQezUIZSLl5ZQVIIp/7enn9JXWnEZoUP5ya2ROf4o+Mzy9hH
 0x4M0nfPlSQUYlpR8d/PXT0XYk4xCIoa6PhihRj9pUcKbg+5o2uBnpW6mgsMJ9/11p+D6K6R9
 YVajZ//R6h8l/G7BAr4ge6ifKWPf1qdDFyqzXEMZX+DhXlNaH2qsKOyJYFPHGus5swz1iLDOJ
 vwf/lo5/jJKyZrS/Osde4YMQm3QL0sWoxAUUIXSweiohzfrfH0rwsRntZKOtTiFodFuwI=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=o9d0IaOM;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

On 23.03.21 17:26, Angelo Ruocco wrote:
> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 23.03.21 16:36, Angelo Ruocco wrote:
>>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>> On 23.03.21 12:33, Angelo Ruocco wrote:
>>>>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>> On 23.03.21 11:17, Angelo Ruocco wrote:
>>>>>>> Hi Jan, all,
>>>>>>>
>>>>>>> I have seen that arm-zero-exits has been merged into next.
>>>>>>>
>>>>>>> My understanding is that right now the only officially supported
>>>>>>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>>>>>>> with only a experimental patch for the xilinx zynqmp firmware to
>>>>>>> enable SDEI.
>>>>>>>
>>>>>>> Regarding that patch, I have looked at it, tested it and added the
>>>>>>> missing non-secure-boundary check.
>>>>>>>
>>>>>>> Are you thinking of submitting it upstream? If so, how do you want to
>>>>>>> proceed?
>>>>>>
>>>>>> If you have everything ready with the patch, I would not mind if you
>>>>>> pushed that upstream. Just CC me.
>>>>>
>>>>> The only thing missing is a proper commit message, I could also write
>>>>> that, but I don't really know whether it's appropriate for me to
>>>>> submit a patch of which I don't have the authorship. What do you
>>>>> think?
>>>>
>>>> But you added something to it as you wrote above, no?
>>>
>>> Yes, but that's hardly worth adding my signature to the patch, not to
>>> mention authorship.
>>>
>>>> Otherwise, share what you have, and I will kick off the gerrit mess.
>>>
>>> That is ok by me. How do you want me to send the patch? Here in the
>>> mailing list?
>>>
>>
>> Yes, just drop it here, attached or inline.
>>
>> Jan
>>
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux
>>
>
>
> You'll find the patch attached.
>

Thanks for that, I've finally found the time to finish it and create

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/9673

I'm not getting you on CC there, likely because gerrit hates me (and
vice versa).

BTW, how did you address
https://lists.trustedfirmware.org/pipermail/tf-a/2021-April/001093.html
in your setup? Took me a while to understand this, at least with 5.10
(wasn't happening with 5.4? didn't try).

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2d9bf4f2-0c6f-525d-1da8-e5ccd276394f%40web.de.
