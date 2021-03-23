Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBFFE46BAMGQE6ISRFUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA8345CF5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 12:33:40 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id 9sf972782wrb.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 04:33:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616499220; cv=pass;
        d=google.com; s=arc-20160816;
        b=jk8qtUSGn3ZhEXYETcXbmggIwFXm4p0/n9+xatpafqWAz0+i1lr5lHvFleUsKqL3L4
         8DY+obPcPN0FMLssDIKqDf85BQNx46aVvKKQeMNb4B6Fjktt4vfiHRp6NglzvP/Z/C8t
         eFRjiDiPbdtrhaehQ7THVlLjfWEcsc/dZXsqeBgnd2sTG2LkC1wSXiNjmE/YUqKdkW3d
         ALi0kVlPQ4JMYt1J3Tjohqdst1NrXxDgXlO4xLDAyT9sybdjHArs6Rshf0ZBkA43+lXk
         87SwWzPeuy0I44K+EnIq2HqaRrUwPCemvGXId5fRVlcwapvRnqxbqSRjfMvsornop2W8
         7RYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=5SM5fSxwV0ecdLnQieeQj3mJkBnD+JUVdgZ374ldkxM=;
        b=XwLpNeQtaT20v52mn2/Cel23RM3OxAnezXIVK7yCgg1q18LYWLJpgw5/c4EYODNIFV
         WmzW1hgiD0ByJZVjcT2HY2NhjBmYaSQ5KpAHJQ4e7jdr+qnJANHiYRGqq+UiPkTRQbA4
         En7nA1pJc8PWWtW/eSvDmSWTn7qB9FFUcebuM3SupeRabTTYj3IfbbZBpZSipi0tjKOI
         Gw9QN4PwjAMIvfUsXZfCcD0Xgk2F7OxOnQ4OxAx8FZCP+oeDWr4qjWXL4o5x+Kw+CSbg
         xiFD8qS9H1YRJoXLgvtPsWyWrPpUgHiUn5AiOmyqk9dzAi4XF2t/df9iAFe+hdANZHJH
         CsKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckz3Z8nx;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::62c as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5SM5fSxwV0ecdLnQieeQj3mJkBnD+JUVdgZ374ldkxM=;
        b=EkmewkooWNWtAlFrkSfU/LGwxLFikanIvIvid6UQcE0UaxyxUSFEIOhUPe5gN2kTo6
         PwFZQ4QLzrdsp82LlYCXtBsk6NirlRZ+1bnsT6mik/oND6rVT1dysJiXfj9tJ0Mi+kB4
         o45O0r7GwtktmaMgzBg1VxJEcT2hcG6VdlrNpUt1LMKNfMBE9LT1OP41aQX3e9qwOdMg
         CDolzaH1t4RxcgndWVos01zHeMQ5C9e4N5SXNE+duBiz45tbxOOby9RbcW5PsJgC1wu+
         En9LrHmtqqWPr2VJcjvri1JFpnHeeRWk/CU7dvMvD9uKFp24y9FlV/EVgnneBwNZ5Oau
         plpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5SM5fSxwV0ecdLnQieeQj3mJkBnD+JUVdgZ374ldkxM=;
        b=jSAdtXluuUrMB4Ny/fCsdtIKKT0U/zkxHU9Yz19cpBSFbMXd6fxgY5vxDtDYxQln1V
         cc/+DDVSoEI2Lbd9Oq2E+x8PrJAigSvf3fvGy12dQj8Z4doJ+dA8goVInv9oFHzSEJGt
         LKU9a8P7hnkWN0mHaKm5PTekIVgzB5SX7H5XwU3hPZIYUyoQ9K5Fqn4dDDD2wwnnaoZL
         ISAxvrf91Bp3YympX5rP+WxI3LaXL9MjZpDZ6sCHfLflb10TZ74WaXYtTIHt/8OWMcAF
         PARWjLiAQeq1hr6QFs+6jWzrlnELKShVG3DXCqjjSXSdroReNGajuITVQ2O5o8ZWBCXg
         ITQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5SM5fSxwV0ecdLnQieeQj3mJkBnD+JUVdgZ374ldkxM=;
        b=bUvAiCsDxViuyQAEs5zJAbkaoJua8/uchhsSBOKgI8jv4aVCkQy7hHx0Zv6gOBfVAn
         iohCztq3V8G+xMwXgyVF0dp/exoYbRouTiBwxhmurN/9+UwPzASkz3Z6CYUmJGzN4JHe
         9w2p3KtHVbxgJ/UzAuZuF3JCwyiZMHwv7jTtzV4jDo3mxenXfOE1nt0YjulXiCI0Wrir
         cq1bHb5SKGao78K4wzFRaMGbWTOtY+uHtgeVNpcQ8o6Eo8gMHQDnMPeBtm1CeKfTg2XJ
         hzj1ewjO6LmzeatLcI3PBLFz8RnmbvwK8/HCY+CZlaKlO748MBIfWHUDD6C6WpWP4bJC
         Mceg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532C+vZMjF/9hVbhJdcAKHYI/tS15pomeSUJZ8XFB0R+ovLLYxZ7
	rq84zh6cG48A25hH6HMRRAs=
X-Google-Smtp-Source: ABdhPJxaqXbw1ZTV4vOVtmiHSP46sRQGXjaNkGvnbj37Zxwn1ueBN3Q9iJkDVdqoCUtDEpy9B8Jkig==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr3525276wrz.77.1616499220319;
        Tue, 23 Mar 2021 04:33:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a89:: with SMTP id s9ls2427410wru.2.gmail; Tue, 23 Mar
 2021 04:33:39 -0700 (PDT)
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr3388371wrw.289.1616499219343;
        Tue, 23 Mar 2021 04:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616499219; cv=none;
        d=google.com; s=arc-20160816;
        b=xcKZxiTISQFMFS0yR8oDZ8GEWDLApn6v6gntpb4pgGgv9muaA4odiVUA684cFEztUp
         gQMHIdNtMepxdS6VnKp22bSVbXPaexSVcLyp9hNXalOimPm26HkDAbJ7JWeMgLJLvztt
         hryiSCQlLNmFppHmJnvj6NIz7w/AtNVR/JVMzVw3xLkNXkLV6J0oShOkkAqpCdqacxft
         sHL3BpL2zk9DCzR1oCmgvb79jDa0GXLemM7AolCFp/rcSl0DvUD5IUi27f6CPerPSwuV
         whVpLKzKPgGnw1SB8kfWQpfp/JW5So3LkhiWmwaIufjV2hFjIXYhGIGAbJo+i8bOquqD
         3xgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=RecS7/Jqw5pFXGiNSvp3FHtlQXo/wfk69gi7tjsrRd8=;
        b=Qs8zvbNxnnDcu9DjoMkJa4L6WAzSyGvhhzAgAWb6KP4CjHs3OTFVjv6aqWJoqREQgC
         wyJ9J5zTEvQrh3RaRRzzw/FphCUDcs9rJBlfnrZNB+FLtLl8jT7pir+6VZ5DWOmDX978
         Fy4sViqvtulWiV5Fs5/2fpF5lM+BEBsFa2j/2/8u/6cCFUTz1l5niGWIiXHegbAqvQZD
         TovoeOsuQTvyEfCypFwjx4FAF6T1z8KwhIMcS536Q++GndoSmIP8SQ5LESMgoonW/A4s
         lQap7jU1AZAEEJz8fegk2n20u/RvDEP38CeByoV6AGcnib6kn+wdgDa2P+EiaV3wZoJZ
         /NbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckz3Z8nx;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::62c as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com. [2a00:1450:4864:20::62c])
        by gmr-mx.google.com with ESMTPS id h16si607624wrx.2.2021.03.23.04.33.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 04:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::62c as permitted sender) client-ip=2a00:1450:4864:20::62c;
Received: by mail-ej1-x62c.google.com with SMTP id k10so26531515ejg.0
        for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 04:33:39 -0700 (PDT)
X-Received: by 2002:a17:906:b4c:: with SMTP id v12mr4531562ejg.330.1616499219071;
 Tue, 23 Mar 2021 04:33:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:2d8b:0:0:0:0 with HTTP; Tue, 23 Mar 2021 04:33:37
 -0700 (PDT)
In-Reply-To: <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Tue, 23 Mar 2021 12:33:37 +0100
Message-ID: <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Marco Solieri <marco.solieri@unimore.it>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ckz3Z8nx;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::62c as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 23.03.21 11:17, Angelo Ruocco wrote:
>> Hi Jan, all,
>>
>> I have seen that arm-zero-exits has been merged into next.
>>
>> My understanding is that right now the only officially supported
>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>> with only a experimental patch for the xilinx zynqmp firmware to
>> enable SDEI.
>>
>> Regarding that patch, I have looked at it, tested it and added the
>> missing non-secure-boundary check.
>>
>> Are you thinking of submitting it upstream? If so, how do you want to
>> proceed?
>
> If you have everything ready with the patch, I would not mind if you
> pushed that upstream. Just CC me.

The only thing missing is a proper commit message, I could also write
that, but I don't really know whether it's appropriate for me to
submit a patch of which I don't have the authorship. What do you
think?

--
Angelo

> Thanks in advance!
> Jan
>
> PS: I'm currently renovating jailhouse-images, updating kernels and
> dependencies. Adding that TF-A patch and enabling the Ultra96 for it
> would be simple, and would be happily do that!
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1tnpfVYjnmvuvG7Tz6q-%2BdMZ3PdKxjqBonyFatWh3irA%40mail.gmail.com.
