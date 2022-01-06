Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDWA3KHAMGQE4Z6VNPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E09348612C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jan 2022 08:53:51 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id g20-20020a2eb5d4000000b0022e0a6d890dsf581287ljn.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jan 2022 23:53:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641455631; cv=pass;
        d=google.com; s=arc-20160816;
        b=qv5Wu24oisyfTg4FuwRJn2IFT/AuIPX9LFLc0JHJ2oSlCxIInIJZJ8oP/LlxBBhXtl
         dUJmuYGUFUA1+ildRFLUFRP4S49f4WjQXWU8FdOjMjShp71Q7Yxqg7SI+jJAlnxwFg6C
         sSAawYfEygLEPHe/V7E2o/yAQ1asz6v8UkTZCpfhSlbLC/gFptj8KwvMbYTuUIiLNz7O
         F18/pX85y3VvVIiITvwFQuUVmjW1682+JhGMsUKEJCYI8fR3vhHjLrqmUtTvquIWj1Bl
         gMod4Oc4pzFcPR4D6bcd787pOkjTQizTVr85r4H82MISQq8VGq1F+/1WlaNiZoHALYQx
         tmrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=JIWq01FcU9EYEFxynD7qXNKHmZ1+Zp3rtIYKFid7Efs=;
        b=XXeRtLjwgcyBZaLSmRpO1K9D7WUmrz8AxFT+ayrH4jPojZLEU1wHX30FQ8uvPPgECi
         e0xXSRK8ffmH3sN/iFxGSZGR9+pfijNOToFh7U1MIlGkMjN9Vt3ZWHDDPOg3fWdZwdl4
         Tfbx4Q1/0MICgAk9P8m3qQsnXznU+XqaZ8G+Ong2Za9pXXaUnmWJGeE/PO6jyTyR3glV
         96RGesTL7RZQZnA3F1XHxt1ogW5zktTa4oeqwRyrC1Gi+asI69bZrcxwrgbfuocUHTVT
         6BDPQHOjPn+cHS/PK3nkJfXzlSZEyOokgt6PZpAw8YhfCka5pR13uvesH6Npb+DsDJlg
         4YcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Ml3GaEnN;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JIWq01FcU9EYEFxynD7qXNKHmZ1+Zp3rtIYKFid7Efs=;
        b=JPhaK0QSTdU/OmxTHtaObnElM1mXQ8FxZOpivHOBHfgZIijlGmd13JF6YWLiO/5Yq/
         e8UEmM2GQJKb+cmy88Pbg3sXZrVT8JOjN/Y93Cjtfib8GhYUJwgHEeAxhlRtB5cyqmk+
         eTnC2P+8BFqTVujk9cJr3Ux+74TFdpOyUdmk1u5ukF1netQB7HTNarSpRGidoh6gj4oa
         vzzOe9ipY11qTfVSDKajHQfJjA1DIDPPK0/sXAqNyv9SHy87TND7SA46sC0t1Rkdocwc
         mSdhWrCRzto2n+jGituJlegx/OSDRi4gm5isSoUzJOyar3E8mqUp1ThOc5cs+FGXyWWA
         o9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JIWq01FcU9EYEFxynD7qXNKHmZ1+Zp3rtIYKFid7Efs=;
        b=xomHVy6kCL0uMp3AMXD/Ds1HPf+hOT7024QRV1ljSd+r4OwiU7mxz3BNdshBiNE1Ly
         av/q9IzuPjAdECh1nKbyQGGE/8B6C429jy+YNeYTNnJ0u63lBAPPv12wKS/k/pA/vjF7
         FcG+oNO5HUuf85vJecxI+g1uSvx57Aon7PBhgo9cUatYjfVAAp0LgSFbCefsABH9k1zF
         d3EU0yA9MDZJi7E/AUJ26IdJ7+hBbsgKcZoz7N1WgUgPY4tqN6JZDfS/xrHBKi+wDBvi
         s0b93xyyRPWRCcfXlFzofMDzo5YIIrVKq+Tuc6cgj8ToY7E0TnXsC8TE5otnTkKEInJa
         i6Tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53247qWjJMvmiZvvzE6EvKwMusarrVd0dXc8FcYqINtxFk3pdH4D
	VwiQLbNY/9iQCw/NrP3ZZIg=
X-Google-Smtp-Source: ABdhPJz63/qklfKfXcQiHGUU0yrZMacxI57njz5Miu2ONbPyelc9Y/0B+9XINEU4rNPcDMi2wmw/TA==
X-Received: by 2002:a05:6512:401a:: with SMTP id br26mr50283700lfb.450.1641455630741;
        Wed, 05 Jan 2022 23:53:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1112:: with SMTP id l18ls744172lfg.1.gmail; Wed, 05
 Jan 2022 23:53:49 -0800 (PST)
X-Received: by 2002:a19:4f0c:: with SMTP id d12mr50930238lfb.385.1641455629706;
        Wed, 05 Jan 2022 23:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641455629; cv=none;
        d=google.com; s=arc-20160816;
        b=rMQJlsZgDjZK+hJjewBlqaART4C1v04apjH7lrSfLpwoxK1oIWo480E2oS73+cQmrA
         XUsjpX6FQgJqeS+vRHEOtGScpuvvZtcFJnm14MRBHm0Gkx5rPk2eRXu6WGB8GOE5nSDR
         WPl8P/d11pnurnPaK3GEnTVQTg7DXKaioMFL/qUi5aGsqhb21xeOs0jM7qTAvCSdNxVg
         J5FM03zRsp8JDw70AlmT9+PT2CDlXPUrsX/n8qiQtEKkAHAlacqufpR1KfVIHIo2AIBx
         n8itsT1WwD+royiSYFpxklGIVXpESK2L2eSsMqAAlhdhhjouUWNpQAoN3LzlTbOuZpDG
         zwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QfGsZNOOytWw7nvC7ey+irB8UhCjz9Fy9yMKQI/mGY4=;
        b=COh/x/A3rgWM9wxRxvpmZtFReGUtbcqp7QMzGablayNs5g7WckzfrWf3xJzhTHU3UP
         0Newm37p688yzJ7O0d9Tz5Uj66fv5l7OFR5aqW5z8SUlud/i2Elyt6cFli4UR7sFiCzs
         a9dOscyUdyxx6AtpNmGLwdgjRKkdkGVSInbJgR2IlRYO4nacUCj2+vR/jTPVdDMRTfyE
         2kZJ6lU8gKRYyRVN7C5uZe7cd2tVA5EsUmIKTK27olKj66LEP/5/9pIGD07DCyIojnkx
         q/GEUTNFUKzmVoBhKlCL5Z/EEPs6g9Ha9gTo6rgxgLsSue8KIeYqE/+6WMl2cQmrRszr
         Tzsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Ml3GaEnN;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id j15si60259lfg.9.2022.01.05.23.53.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 23:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnFy4-1mdiLw0D1o-00jWoY; Thu, 06
 Jan 2022 08:53:48 +0100
Message-ID: <5f6add41-9c0a-0403-979f-19f4702dd45c@web.de>
Date: Thu, 6 Jan 2022 08:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Help Needed Regarding Virtio IVSHMEM
Content-Language: en-US
To: Anmol <anmol.karan123@gmail.com>,
 Moustafa Nofal <mustafa13e09940@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
 <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
 <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
 <04690e24-6aed-4856-aa81-f56f493821e0n@googlegroups.com>
 <CAC+yH-ZsR5AqLjCuK+y5ePczmiMK7upnkh3O+ppq8nEzC=j1TA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <CAC+yH-ZsR5AqLjCuK+y5ePczmiMK7upnkh3O+ppq8nEzC=j1TA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zYZCSaPRWatQwbTv4fRf3+Mwn8rRqg1x3j00cPc0Ic+hykNn6zW
 jHm4MwbWc5wIhdt21Ng+fY0iNEm+Cy6Lr3X6DcofJ2N6aCoUD9PedWGAFd377Fg6prXcREW
 NDypLFMNMe7sRcdBRXvaO7r2oaDe7D0BXhbMtIfCzaNqDHdlVptP+xojJwGcGOKp8n4q7WH
 S5CD7jNpgjRAUYjHVjcuA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LpHoj4/41RI=:P5bGlUcYkrbQpMXVeLe/ay
 VpxNqzjgi0Tm1EZpw3CgSZEJ6I6ILF9JIo8of/Uy1iFOFDV6ARao4/cIFqdH+8Oao6QfHkT1t
 updkGIConpnttWFjX2xm96WOrikEWdvgFEgUQEOeY/0tlv+GZXbP6vW8U7P2xK/RrwQ4XKk+y
 4+li9qpU4dRoHQ5OImc0fGBDWOLIKx7H9GsvsJzwQ5psmiiPmq+ZhEq0Xj2XET20tNsMZsk4z
 p7dC+gWASl2WxWR12UGuPDDpSKMhTqNd0mJXYRlNylMsbscz/lnSzNXKpBF63ljnll2/zFSS7
 NEd+CZvDxGNcFkPaQMOB9Zpu5LLPhCEn2XJOoyFRCrfXOKSr/WpzBXc7vhkscrrDxpnJGFMzo
 RFUN5b7aQm7KAMQML2cVJd/rdkj3LM73dfMTyPO7SIN5Z5054SZ4R3OLSVbAOWnUVb1gofsp7
 V1O6gekfnJNPJYs2E3aOl7oWF3zW9k7PyU3IvQXd1OnbyPEYAQonor1ELd1kWx0bh+IRQlZNn
 TPwjnhSp4lvBTqC4wZuoLwbgzUEz10iOCXlGjBoor3IgtW+Hyd7lJsL/GosPVB3Eil/E0XM/r
 5H973CLpnCz4g1QWGpf2y5U12318OeKfuZKJLtZfuMeRa/CwzMdhQ+IudhBN6iBvRWWXbf4lh
 myOt3SFCRPLK3hwJXxlEAUadNW3mhrN+t109VYu4rUVPHjGjRJfD+Sk3LiQCKtUTH9+hEiXqW
 rv0BwZPJDmvuoOT29KAV0HgwyglUwZOq8hdBO1YJmD6fK8/NiCd0arQ65YdveNHUA4QhrN3WT
 EdEYs6P6g5kjLHi/GpJt53AoJpG0haO+DZ/LVjaIszljCRMYgC6LsGVu43o385Nx9piDusGWH
 B9Avz+IHMB2tPgExHmsRJGY/LVIG5Ky/NU0K5058Sk/WSfkiIrp+wXar3W6uhvmsrV+IULFJD
 2T7aEPFUEvzyFnqMU394i9DtcMJg6JOcgG8YWEdzBbcZOOZue6paBIrYpnkDEDgCR2l5S/gY1
 B6sAVygVrMA1wqnYR2SvNBJaDy+qWZd2SoFopbeAfRCTwtsRFB84KdSbvhUeDTqKAsRiv4PyV
 h5aV5KF/vPbgDQ=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Ml3GaEnN;       spf=pass
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

On 05.01.22 22:22, Anmol wrote:
> Hi Moustafa,
>
> I already added `CONFIG_UIO_IVSHMEM=y` in my kernel configuration and
> can easily load `uio_ivshmem` on the target image.
>
> Also, I am trying `virtio-ivshmem-console` so, is there any need for
> `CONFIG_IVSHMEM_NET=y` to be added in the defconfig?
>

To run the virtio-ivshmem-console backend process, you just need the
uio_ivshmem driver. Make sure it detected the required device properly
(kernel log), then virtio-ivshmem-console will also find the needed uio
sysfs entries.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5f6add41-9c0a-0403-979f-19f4702dd45c%40web.de.
