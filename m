Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBB5VXLTAKGQEIVTAGVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CEF13E64
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 10:10:48 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id z5sf8819266edz.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 01:10:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557043848; cv=pass;
        d=google.com; s=arc-20160816;
        b=UKpG8XCnOpoEqifL1q3jFJVnPZBsxM89StOtJZQ0wxRdr03uDktKpp9l4dq+kRK0N9
         GNQlCcR6hmRTaM8YY2f9UJpXIY/pWrPvmzd5ncL0WuQaJ4sGQBO7q3ncp6c5UDDQg+Uk
         kHDMPtqppAt00+eHtKW2U4/qQst2hP1S5lQxA2v4om+Y2TeMWGKxK0EuwB7dBtsQ/X5j
         L78akths1DY8LNPa5ujiKG1jVBXjTj2dTEq1ei3DSUJiFKeh+9H7kpNukUYPiE+8Cc+K
         z31225oWS1ETD2vUvbue9O+OLO3E9pM9uRYyDILzSdNo3/uPX96ypwKAkFvx+kjahdiy
         clBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YjoLigcUJT3o5JevXp3KNRcAJNsW8nE6yZfmcmMv4XM=;
        b=xzZ/p2aobtlGKdLb1qQRGl5m1J5Sgu7Y94i2zDoAQ5xAZ32jTLlhjzh9//vm8KnK5u
         1CcoOV2pb2VgCBRSRDgkjK5ZlwPsiGZUuFuBHAvQZK40Y98BSNrN60Gd9QnIbj+j9izf
         wbHqJFtas4N9meTCaoNHdP3kA0w9hzQ5txAb0Wop7xmJld1lpDgzhMDdhBQce4QStf44
         jTvUZ+WZNpld38JdemLElGB6tLPMyYunawAhkDv15gbjyegnPbQLSsBJSv4cPTe1tNCu
         gwd4vl7cMQsF1IefOmDin+3eXCeFns2gB/y16aVMDGENNjQ8MlicU6oQCqnG/9Ndhp7k
         hqFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lOlZFuB0;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YjoLigcUJT3o5JevXp3KNRcAJNsW8nE6yZfmcmMv4XM=;
        b=N3U98PjJsWYwLAfUJaZ6Kpk7we/ZqO6w3MCqNsJK2u1vIiIY5JQ2qPVh2iqrLFa76A
         xeqqwChaqVSLcUiC6MlN+QjuTG2ZIUHFQODj07PxPQXWPZCfXMANHTmvWgE6vvHeOzB0
         8m/rC0FiZSaFEyOGLtqYft3y+bieaesBuBs8kiTyCnvVQ3WTMgQc8z/F0fZPin0j0Phi
         WopQNJ+h4yGsMakadiU7bsVSWYnAqrBtN7z2+ieedbka6ZuojYDCDwjxS3fkq64K4R/s
         GhRBoWXZlH4qGqClDkpK8UVn7bVb6OjhK2nUSe+ep9oH78BWBtjuSx2xZ7iWxDaLYvEP
         1aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YjoLigcUJT3o5JevXp3KNRcAJNsW8nE6yZfmcmMv4XM=;
        b=Pu3sqze+NoEiFghV9p4yjGtrJ/nBfQ1fOoH+3LjCaKFIJrRnm5sAaNHtRmcnuqkjPE
         p4kNO8YvXiRN1PASwzBzSnWvjgm8j/unlykr5CeWYoplDUWvt//+vwayZCFmvo+dW/d+
         o2D8G3wNwSKkrTeI9U0mDtaC+Tk4KpigilYAxK4+CiL1mnmeKBweeBImkEYKkaQNDaud
         h+W8MW8BheJmM+nqbrQS9GuUXpo79fkW+CJXLu8JVAEQMBcVYg3ncHbulAlFGDwpcG3M
         Biwtj8mqGHSJ5jdy9XPhrZW9kfyT/71NTaBa+WLy1u2Y/VNU2XVv3+KyOLaq3KS+Gw+O
         DQzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrH7hjeYaxj/xVK9qdq+1edk/cDiLP7Ho2i5DRQj++gAxQUVNU
	dZ3wb28NDq4xPpN/mSLoGbI=
X-Google-Smtp-Source: APXvYqwgomU/7g6zc7dTz07JAffSiwRdGKoRNRBnRRYLqebd/QboLFf+D1Y1ykL5N3QIZctWOfqj7w==
X-Received: by 2002:a50:a5fb:: with SMTP id b56mr19062706edc.262.1557043848315;
        Sun, 05 May 2019 01:10:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6047:: with SMTP id p7ls1889188ejj.5.gmail; Sun, 05
 May 2019 01:10:47 -0700 (PDT)
X-Received: by 2002:a17:906:2542:: with SMTP id j2mr13845072ejb.217.1557043847567;
        Sun, 05 May 2019 01:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557043847; cv=none;
        d=google.com; s=arc-20160816;
        b=RCX8+cr/4nxF2xihOSA2l2GDVWW8EXDD8ebA6RiUJJ3onMziUuUsH+2Mt2ExcoGPop
         4yBYD4/YwigKSFqexHyB+l2mLdKGUyG5ojBO1d8WdywgpP1wH5afIOEHwRMh2AUmPI2t
         U382czY6oFe05S6lo4KXuYx+4BfNBw467CUcxAlP5EBF/mGoUkepuFAl0WerZDU4cEt6
         QoBhD6ySR8H4U4+zUYTxNZQRuvycXxn5xMf1cVwkLNwxNgFOA1eXyRnPdwHLy9s+1dUR
         sVUVdWa5sGiQFGmWurTirHYf++l5t7q6vsF/eMgEroGoCQ0XAf3arHZAzjkePytBbywd
         uwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=U8NcywHbgTrhDEQwkZJreD81ruZgIR9ZUXBj5PQc71o=;
        b=zDAOU8tSw68fyAL+G9glWteCGY3htokwVLvhKpajv7gPgLy8oE6MqOakkehdYiOOXv
         /YIBPtYNO43hIPFn9wF3Orpzzef+esnxn/5iDaz3VP/zcdCNScqlFQP8aWQJa2sGXuuw
         CNgcndQPpeaVAnkpA44nvgSH0iEcbiChVSD1y+6TFBpPA2dC3q/3Z0t9ltVAw2tBu/na
         C0MQ8d/Ay9CBMl8Sz6FHCukNmOlNUsBPB0VN7Bf8CUXcFHQxgXvR4dT4/fSdX2/aWtiT
         2pT1259mHPSE/7sZbIm1fcZ9K5c/IlcagQYfZfArmkMza03/34C+NBDWfScp9yt8IB/G
         4neQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lOlZFuB0;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id j5si281880ejm.1.2019.05.05.01.10.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 01:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lcxw8-1gwh7O40FU-00iAjV; Sun, 05
 May 2019 10:10:47 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
 <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
Date: Sun, 5 May 2019 10:10:46 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ONNY2n4cLIaPBqzrI+9OscCRJMetWcSDRY/ApMG4GYIqMmFDuWq
 xCb6F/1zW3a1wF66UKZvp2Y+GmRULujP9FHxuEetwVNelYddeDqV6uXiCBkdDeTbN7er6VD
 D8baYUH22WwAn6BCymRHqjse/Ah99NXAHwthgholBae8bHkYmhkjEKfcpqDpY8XmWmqftxf
 u8QvnJvf8Q9OGG66bPO3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CXq0+roJ094=:urwKtURnVNi8MhCDIqy/AJ
 YjOQcAbpdjXjqiUteQGMJWY4qEjd4cVFeUKP3fpkqJB4zMlYf/sohECLUzsDeTd7ao96JGUac
 1LBPSAgMDmp01sBlIbi6aZ0vqhAgd7eU8p2W7ZgSy1eI2XT9SI479y+oloMooFW7J9fSXhNku
 Ba0A5gYfeiz6F+Hq+VLBi4rW8dPXr5dMnJvJWOvCUSwdDzRFJcZtJ3CkAzFPzFYRfeWoHy0vT
 NenN4mRb0oEJ9JY7rFfqP+bs+DJyuE26hH4Xg1Tw72KXE5GI7eOtX6uSsL8+zd9rOA7fcw7uV
 2EwfjMD6tflNGIkQ3azFwzBvx0tm2tBdLDs8WEM3bS5EYGmvPdSP24JMFRcW3+ILWSsaJObBJ
 JjeyjA+FfW3iFy5yM+a1TY30rEt4MHiZWWeWrZ2hEFZwKq/qX/IZziAgD+NENHxOtt7OELuko
 l4QbwksmMCp2fOQY5V+cPQNaflXxA7qJDftt6jseKcjFFzpB2MA8hViQuiREFgKxY2487nqNf
 ntI9w/EjRGGZNTnSPz8jQ3xTm0olKDOUZUzxjyZqyvDosNAK1sFo/3/EUZZjsYS3hYBXX7CSF
 5FGLADLgXQhkicW5BejchG93ITrgDCDiqyMLl/CsPX1M18sQCShYX2a263Z1SQ1oEgF3xu76n
 1aJyBri/c3ri9UJeK3jWoGSx2W4zSwSwhaGYDicp/w/lhNDWv41n7TKhy7JpEDUy+vN2RbSgl
 Zm9yW9+36+wikL5d37Cv0C4YB7oUlTp8oNxNiSff4W+2MhFi043zcAxSNSDhnr4yRoS16zh1u
 svQ03QwTvkioYyhAHhCFe3g9VYeo0rAwOcdXOF848bzJLKSNCRknTsbxJiJ+o0TI9VHhpELMk
 27Dv5BWCLGcYsroAAW0CR/TJjPSqzuFX4+8ACY7W306jhWQfqfP9iS+w6UMYg+lIKQpzbUGhS
 smxvsyXLTvA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=lOlZFuB0;       spf=pass
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

On 02.05.19 17:06, Hakk=C4=B1 Kurumahmut wrote:
> Hi again,
>
> Is my last patch in my previous message correct, I am asking for my curio=
sity :)

I still think it's papering over some other issue, but I need to regenerate=
 the
config from your data.

>
> Are you planning to support USB serial converters (/dev/ttyUSB0) for debu=
g console?
>

Nope. It would require implementing a complete USB stack consisting of host
controller (xHCI these days) and USB serial drivers.

When I last ran into a device with no easy option to add a UART PCI card, I
briefly played with the USB debug interface. But even that is horribly comp=
lex
(and, at least in case of Linux, also very user-unfriendly). The outcome of=
 that
was the simple EFI framebuffer driver that you now have in-tree.

>
> I have started running inmate cell on "HP-800-G1 machine" with siemens/ja=
ilhouse->next branch.
>
> On this machine Root Cell running very well. I have not seen any problem =
to running root cell. Then I try to start a inmate cell (tiny-demo) but ter=
minal was hang. I have opened new terminal to collect some information.
>
>
> Terminal Commands and console infos:
>
> Page pool usage after late setup: mem 3884/32207, remap 16393/131072
> Activating hypervisor
>
> ---sudo tools/jailhouse cell create configs/x86/tiny-demo.cell
>
> Created cell "tiny-demo"
> Page pool usage after cell creation: mem 3900/32207, remap 16393/131072
>
> ---sudo tools/jailhouse cell list
>
> ID      Name                    State             Assigned CPUs          =
 Failed CPUs
> 0       RootCell                running           0-1,3
> 1       tiny-demo               shut down         2
>
> ---sudo tools/jailhouse cell load inmates/demos/x86/tiny-demo.bin

Missing target cell "tiny-demo" here, but I suspect that is just a copy&pas=
ter
error. Otherwise, see README or man page.

>
> ---sudo tools/jailhouse cell list
>
> List Jailhouse Cells...
> ID      Name                    State             Assigned CPUs          =
 Failed CPUs
> 0       RootCell                running           0-1,3                  =
 1
> 1       tiny-demo               shut down         2
>
>
> Is my command list correct?
>
> Is Loading *.bin file correct? or
>
> Does tiny-demo.c need any edit for specific hardware (currently HP-800-G1=
)?

You may want to adjust its output channel if you have no uart. Use the virt=
ual
console. That will dump the cell output via shared memory to the hypervisor
console, which may be virtual as well or efifb.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
