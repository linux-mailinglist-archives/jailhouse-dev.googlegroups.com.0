Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBQVQ36EAMGQEZP7OVBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72C3EC363
	for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 16:50:43 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id c39-20020a2ebf270000b029019c5777f07fsf4034838ljr.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 07:50:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628952643; cv=pass;
        d=google.com; s=arc-20160816;
        b=g1VrXl1rbG2zVwdm2wAY1blRgUTIkkvQwvg2Uv8tXvzRFsvg29Kz7gB+CUqX+HdFvs
         S/zKvE3XhZppxuRFVWP/n8N9ZGhZ4+zkd5IHMtN6eEUaXEbpL6tsVhgwF0kGWZPWijWF
         +jF5rep7IWBBkgzAqwTyGjVkjXX0iQLKZSx1ElGJOAjrFI96tzIN/9ZyIEHXnxnUJ8Pf
         cY1V4puoPdiQzv6TjF4B+FwDliZgQSqCJEVsxsOpmR2AkaXk8X0Iif1oHyjR42bpPs3R
         SC4/7Fvkw1PqGG2ehDt7ojSsrQ4DierzMsSnMZru3D4q46kXXZdInyYMrtBTN7PIMRlH
         ae1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=tBOa4YBNCBXiO2Anh1dNhw5/poQZ19vFAMgtWlM7yIU=;
        b=XutG2OgLDHfpGte6fiqYm/Vx90uJc9lybTgc787fEsqMNJ8Vnj5v4lbtyMxreDzZSa
         wkn9r62ix+JRwfz/P2W9jzqKumu9+Y8+nYsFRodGY9FQsPmlkMaiLtua/7IXp8BGwvGa
         1BsNu0sD72ukWaOkN4kib3N1T5Kcp4u+EA5v0BB35Zq5BhY8ySZvtpU+4/D1QkR36bco
         G52U0yjlXGshycevJpCeXAV0EnqER1pjQzkKrgjh5dELWnXGiQAp1MKfAH9cx3z7dPyO
         RBxstE+U1YYTRJNMPb+bJ7CORXZhL8CbdA5hKCNjsbFUd6KawwfV2ezPBUvnGNckzChZ
         HQOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YE6KBHyo;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tBOa4YBNCBXiO2Anh1dNhw5/poQZ19vFAMgtWlM7yIU=;
        b=Qz942PwXhIFJVtBvMskYlmecyW1CDhxgZXlwlndkwapS6yCgbP2v0gsynf9CNZ2zKI
         R5wbvEjb9YyU7gVAAJgb8nZSVcTG19Ghqo9606UVQp1E3ZrwbM7DYcUm6N7CSyA1Kv1W
         P5fMOg2qz0aLbKa+mZnll60ltUiCPVJvqjyPAtHzDVtqNtcDhgUuOgZt4bLSp4WnHe5R
         eqD4kmcLhiyCvwTFb0M5XCezePuhTjQP+o1kyvVoAdqclNsPaO5bSsCUSAQt09akNxuS
         oXIg29ei8y1dLTDkiHuZKRt92zFT0+n+6rFXWwUxiSmDpu9jRSxRdTwJQbiEj1Gaa0Wa
         6Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tBOa4YBNCBXiO2Anh1dNhw5/poQZ19vFAMgtWlM7yIU=;
        b=AKgR5cVSsM5I7F3Nsvaaw1pbTQEycl09C4uwnaQfuwJuPmPIgBwa/Yh/CsNtJg3Lh3
         F/3M3DaXovV1TAlFayubyfmIdlKITZODqNx1zuIQ0xCuCUYmASrTTCE2cRmBOCvxeuwQ
         vJp+Eafkf1PYuBQXR8vtvz7JkRiGiw4vuM1ZZ2MkAOtllW8BSCD/Nl5En0naunfYSVtN
         p5AMKBRV34Wz9MfsEe+MXBHxs/ffItyUnrYOt6oeB6uvmdBNS89UslfxeFW1Nxrd2t2M
         EGXB47Prj66gWb3PSCX2KF3heiOR5koDtTq/MSc9cCSkac/XLWFDaJ3hYJaQEd5AZBLe
         j11g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nQ5wRLGy/LQCXM2F0fN8BiB7pdr7yiFUSYOwofqdU2QZN3zSW
	UJOWVoWS57zgFoehxMPujaA=
X-Google-Smtp-Source: ABdhPJw6PwITvqWsQ/HaPJQBmiiCKDFjBptnCLc/9qd9rx/T2kc4kA8Ni+vOrTnTeyDy2LaSkmtP+g==
X-Received: by 2002:a2e:9606:: with SMTP id v6mr5772557ljh.134.1628952643266;
        Sat, 14 Aug 2021 07:50:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9109:: with SMTP id m9ls714033ljg.2.gmail; Sat, 14 Aug
 2021 07:50:42 -0700 (PDT)
X-Received: by 2002:a2e:a231:: with SMTP id i17mr5543883ljm.467.1628952641944;
        Sat, 14 Aug 2021 07:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628952641; cv=none;
        d=google.com; s=arc-20160816;
        b=qBVIEHxmaOavn6rNe4j7HS5QMYSpeyd+W/6+XJDcqRXSTqSv88hoEgb/bkB0qcuk42
         gW3lGVHSVIM8b0rbM7ruWAsAoL23yVVS/KZNcXpUWWl4qhl29iV4cbwduPlY77A/van8
         9TTQU26mnYUyYDcCoy6K5o5FXrkMfmevdpis/AgATi63Bu87Voa/xxCwdRbUDH61rHIs
         bK0SchfXm3MIALLf6QCiM4XjkqijdEPtBL8m+yc8p1YQvG2WIOy52Bx8jiFl8u6OdJLs
         OPVgkol9VG6HAYXOmQ+A20NLN0qIPpSeI3/nGkdPT6iWPBn/sjagszZZbKKWXWQ0wBnP
         6/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=RcJZBKZupW7cw/EfkiSTM/DlH9x22LplIcyZcD08gJ0=;
        b=X/3zOV71lG9CD8iWygzIwH+ngahXsyl8rX0fmjnPzQIRxczwMsHbHjF3oNqFRAXkl6
         0SrNn/vLNLTW8WsPkcDqOXly2iECBf+kAtHBp5I79VbsEX7F0DZvq63lrWHny8ttlkyl
         J7WtEMR7DrB7bfYMT96Rt4mU9fuKBsv0ZBmN+HZ6RSmGOkd3Dyys5SA8ScXkx10lhgtf
         1X/DkyRIgsNdshy3EdjW6hXC+sSUzIjaU9zggeRhnBzQg2tA5NEJ/C4nC50wdG6ZIYun
         XUL7+AaSui/Spx2J6+AlLLyakzlceS1fV1txf0JKAMK3Gd8xO/52Qcm3V0rtCMhW/yug
         xW8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YE6KBHyo;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id g5si198410lfj.3.2021.08.14.07.50.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 07:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.227]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MH2Fm-1mImtG3Mf4-00DoqT; Sat, 14
 Aug 2021 16:50:40 +0200
Subject: Re: Help needed regarding AGL with Jailhouse
To: Anmol <anmol.karan123@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
 <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
Date: Sat, 14 Aug 2021 16:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:Qe/+DF6tFBjTeB212MicoZ8QIODKbWIs+LZjIKI/fxInJMRbNkF
 mH9TTVpzxFpl8u8S5kE5/nU1AbXWygetUim/PwjRrA3O6p+5aF658rZ5K+3KslhW9l11OtA
 3K7/Q+kvLI/6JcrZFxxzTtXxKZf6E5sROX1MAMOWziyzzLiGqAeHG32gFj+sAAt/QDWfJ9x
 N/VMWdP9733DXYnznG2cw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L6ROO3b8wEY=:I1mjutMOwpAcWbZSkAQKDX
 uQYJFx9ShPMVyQZHKQUjgszZOmqtMhHNkuhFb0hoP9Csyi8qiB9Xpxnv/y3Hl0p7IG3HoKJV2
 Ab+arXZALmI4qbhEjeptKAPe7/aZs3RztlE8FcEXfm4RWinFOEyG2n2sA02b1HHVIw//RCz2k
 PaGXYvWbLN3ZdNxves6gnULl/Hey/tuaxBGBmD4bfZGoNcYlfjNTKf2JdsAbqyvjUvHhR+k6Y
 SKAdH3YRoFgDlBBLh599nMNDKkG5ZcEo3iVS+iRrscRkZPRER+p+J7uTZckl098tIZHCMGpjd
 CggBms3YQdG86SQ1m0AlUZsPye11d2QPCrEoH9zP/32tCiZSgg8NpA6wkwOcP0RsGWU7DsmV5
 3wemoTtZ1S7kI4+JHntlVbQMgngeGtTopQwEWc3MGEY772RZqP44SFD76MNegmu95rCNgEBX/
 Tq+TmR4UMxHdza5Ch9YnCTLUgouDulaX4Z/LznliVV9iXtFNz/w+aJASeGmrx4TLXyKXtIMhM
 EymxsgWyW7R2oo7alnPJVOH/2U+BtgI/bU9uKINhrv0v3P+G+7J1gNnpjUlGC7osPqWcoq2MV
 DggzO0ctczmWGQR9w/NpzRqyuhld1Ddp/LOx/Xq/uZxqXDixz0jeFWPzEiVMsmksmCWSVCYy5
 U7BVmgmEGB6Yv132GFdy3Ju1xHmm7bZEb4NXQvXXtzQO+OCuxqsdk+4/KJYty0cS/WBCeBC1+
 6d8WL+J8bDyaqbedY6fom5TZPc9X/F1Ddp1wR6LQt/czp7SqnSDz1lP+bcEebvPtZ4m9a+Awm
 winlDcc0K+kJKuM8qv1xU5Rr0nHoCLQ2bC7JI2CD1lmxbj0ozHyWKxja6KM+gc2sPtyF8Zc6D
 7yaQmPZzbhb3I4XQC2tRuM5dZFUPbZYoPk3A1Gt1uVQIznmFFEMcDPt+pkTacXJhVxMEx2XTm
 L+Pbn0JzqQZiKbyef9Y5/yjnsl/n+VFyetT0OTiGKhyWfWCsXAqRYHAHVHZbsCYz7fTD7ca9E
 lxXojW0BG+sMQQurauYC8Hu1JmHcfzIcaTJlAKbAciZvc4gox1I4HH/qNXUtlxwtw+6UawaBJ
 xUaWJ5gBhUMpWUkYcmEPVcULX7k6SOr493oigOdDKYUfKoxYL23mbqe+w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YE6KBHyo;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 11.08.21 20:36, Anmol wrote:
> Hello,
>
> Non-Root Linux inmate is working now and also boot logs are showing in
> the serial console.
>
> Now I am trying to follow the Virtio over IVSHMEM block and want to get
> it running, some references I took are [1], [2], [3].
>
>
> I am using the `queues/jailhouse` kernel for Root cell, and same for
> Non-root cell(with .config from `jailhouse-images`).
>
> I did some changes in the Root cell and added the required memory
> regions and also added the PCI devices, memory address matching with the
> non-root cell.
>
> I have also enabled the `UIO_IVSHMEM` in the kernel and can see that
> `/sys/bus/pci/drivers/uio_ivshmem/new_id` is present.
>
> Also `virtio_ivshmem` is present in Non-root cell's kernel.
>
>
> My Questions are:
>
> - After running the `$ echo "110a 4106 110a 4106 ffc002 ffffff" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id`, It's not showing any
> responses. Is it expected?

The echo should not show any response, but when you do an lspci -k, you
should see that the targeting devices are now driven by uio_ivshmem. If
not, the IDs might not be correct yet, or the devices are missing.

Also check the kernel console of the cell where you issued this echo.

>
> - In this command `$ virtio-ivshmem-block /dev/uio0
> /path/to/disk.image`, I am not able to load the `virtio-ivshmem-block`
> module, and is the `disc.image` a standard `LinuxInstallation.img`?
>

What do you mean with "load the `virtio-ivshmem-block` module"? The tool
is no module, it's a plain Linux application you just need to start.
When you do that, what errors do you get?

The disk image needs to be raw image. But its size matters as that
defines the virtual disk size, but you may even leave it empty and only
partition or format it from the front-end guest.

> - For `virtio-ivshmem-block`, do I need to compile the
> `virtio-ivshmem-block.c` externally and copy the module to the QEmulated
> Image?

You need to have that application inside the guest that is suppose to
act as back-end, yes. How you make it available to that guest is up to you.

>
> - Can we also use the `queues/jailhouse` kernel for this setup instead
> of `queues/ivshmem2`?
>

Yes, queues/jailhouse contains all what is in queues/ivshmem2, and more.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3f00a102-357e-de0e-3ea3-f338f00ca793%40web.de.
