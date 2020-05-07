Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV6TZ32QKGQEVHPZ7JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DD1C8275
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 May 2020 08:25:28 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id m11sf1937958lfo.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 23:25:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588832727; cv=pass;
        d=google.com; s=arc-20160816;
        b=pdgNyrvV0D0aqjUm817Zha5OpK1CTTm5P3mT8OLRZz/iGXhqiuznwij50vR1RHLgm3
         yO+K6rNxsgqjYS7fownSyDvn2X/DuARqOWO0Don1ffijzX4dXa0Rume7Wa+HnWmnoX8C
         6n0C3MlKmnrYNy8Ss9P6DXIcsP/768M+vG4Q61oM+D6gO1iSD22erhxpBmDY+lnuCeUy
         FyxRr8ndn5OB2p4McIqiOzPWoXgXgSvd36LsOCbRnOjqrVFVIjQfGXsLmCRdn733nrXv
         WZ4I8cZjZcnCkcUJEkD463M4aC8o+SkCHFWvW+cSRiLY9rW2g2kD5VkvLQSto31vcHJb
         o+Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9O924QQhfvpD4W4jYg7s/1rbwgfMGT7NVndKNQlla/k=;
        b=oGRFKOZ9I0ABryaBndezH6qoH8kAQSiuMMGdlxGxLlEw+bCIfGYvXiEmM7WnPfzDSJ
         uS7gbbe/CfvzwF9LCCavrUJWX9TdERpFxLsKMK6mcAR9oN4TKd3AcQ4NKMcFbkM2worz
         T7OVUAt0uH1cgaEVgDJezCuXRdGzsmYeir7k1F7CrOpPDtlorfxbqnZEyLzM7MMcj4ZI
         wxTD5Wn8ChrZdvLYlMtjedHObHCA+o05ojsRib+sPDtkJARe3UpvaJYwrySM3PcLgiD/
         GF0aAWmnxmI32f+7zVmht9Ifqe07ROkRgBjmNEqdOU0Rpgl3okXiULIpIqywbBq+11JK
         xz1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9O924QQhfvpD4W4jYg7s/1rbwgfMGT7NVndKNQlla/k=;
        b=TLa3GvSMhZVXuMuTzPCsJWS7XDOnlcToqxCCY+XozDrMJ1rwNt4lxlkrmvpwiZ9uiC
         9pG37pjI+IVcMCFsnvopwI2pb4+HmK/ehPrv1+jvbdZ7/TFSFyIkjG0h8zJWHK5PME1w
         MkuBnGbMW3wXDFqsd9ieIk78QlNgWxWRT02QcJMHKbUkLLqtjRQ8+4OpOM1EakhFHmrC
         Ny6mNT4QkcdBqa1OVTwDPXBiNWxw5ehMIKoaMcpZx32jTSwV+XO3y2M2O5Gx/Fa9Qf+Q
         DpxMEUn4Tq0Kc9tMPpsDXexC0OErw/KrmM0kFRu3x9nPLyG+5Q9ZKpOnkS1N0KhDgexN
         1MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9O924QQhfvpD4W4jYg7s/1rbwgfMGT7NVndKNQlla/k=;
        b=IdvlWdB5Eum8oLerDGTafC0Tyn8Ki/gogN4UYVUp/jDJM0xmqO6l5CgkYcwl+sjlfW
         Rjo0a0N1ubVrhp4iv7VS0piDGBkMd9wi1cXUfg/k5SDC7CfzTDJnCR7nhlp1SeCrMznU
         WglDM4faULChKb1uwjIpnNPZalkA3rXK7ATnrKC0b+GYgWEPai+aYrWybMTJvC6V5n5W
         afBxEnK6ad488KhH2w9WWMfqlpd0cImkYfXtJt1SZy9kBFdBJQdAablWBAndbpyZFdDB
         WQajgx5G5BIgoM8361bRV+JliBvm92d4EReh2ptXUxouyA7GIXQGbMpWTcPZ9wpsGcd1
         D4bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaxAldOZ6yL4K52ThikcPmUN8VU7p/svOWyIMRnEur155FHSrAh
	TY0T+IySGqh7r7Bhpp9o6q0=
X-Google-Smtp-Source: APiQypJSVoEjWCVaGErR2zBBqIcyYb8PtVDJjkZ+pvVVSyXx/yrQgCcbktV+9oZXdmFidHlcWh9Zlg==
X-Received: by 2002:a05:651c:291:: with SMTP id b17mr7569714ljo.166.1588832727764;
        Wed, 06 May 2020 23:25:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:81d6:: with SMTP id s22ls1328541ljg.0.gmail; Wed, 06 May
 2020 23:25:27 -0700 (PDT)
X-Received: by 2002:a2e:8018:: with SMTP id j24mr7476834ljg.246.1588832726922;
        Wed, 06 May 2020 23:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588832726; cv=none;
        d=google.com; s=arc-20160816;
        b=gOEMxhoTwEya/dyt+OfPdJoIxmGm/ZK2NR6Bm9I5DeDyDEWBzOoRAcwW1y+pGTulwU
         Xse0ToDnJnKjDKhBaKycNXNcFyNfDHaWDoLyIMWqax/LUXyD7BWD7YXcq2oYQVq2HJg4
         5+h2u9e4CZBdYQcq94DNGMY5/v6PWyJCW41dYAj76fKiq03UBg/i81Mw+rhtX86SP7yx
         s/Aeja3dmjFjuZOR/UDzE85dDa2479xcq0I9aQ5XalG5llDm5RpetQf4+7ptBIheK251
         qHRCXMjFbkqV2xPzj+bqo2ifZ+pkRKwoE4LGBFkV+hLFY6+YlIUIeXJkBXyJgRCyndcO
         evzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=LXQ1Zd0MaJli67kf5BbNjC1tFvBT+jkPnAKV8Xk3FDo=;
        b=kYfWq2l+q6yb5JGPkQ1D+c/hBAlMkxEPVr8i6+ih+PjOY0rxKYe6Mif8s9A3Asztad
         pbVma9jRtkbw1H0PZ1tsRvQcgwwt+kxzlFikCM/qlTdIz1TGk8IY+ejLdEerPgcn8OJJ
         rEtDNu+mBbRs1iCKIKr+bAdtDNyy7qwsYAKNZoxYgV9z85BXyjuKj8PIVLxVABoac2Bh
         LyF+z950qs8i+4Fhh4ShvY4m9CUOrZcxWfFhMHKOFbTH/tkF8+95KIPDHl9y4SNiEEeL
         +Uomt/jk4z+1Genvw9fPwC0t8pCmPFW0VjbngoVnUAbgQNhI96KDeZzV9OhxW7XDq6E/
         YNng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d19si277790lji.3.2020.05.06.23.25.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 23:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0476PQNM013931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 May 2020 08:25:26 +0200
Received: from [167.87.243.92] ([167.87.243.92])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0476POkM014274;
	Thu, 7 May 2020 08:25:25 +0200
Subject: Re: firmware search path
To: =?UTF-8?Q?Fran=c3=a7ois_Ozog?= <francois.ozog@linaro.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAHFG_=Uvm2rLDvMH2w36M_gNwdTLwwUHLfrZeXA=7-wpkasg3Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9a209b64-4263-d08b-7dae-6d8e1871537e@siemens.com>
Date: Thu, 7 May 2020 08:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHFG_=Uvm2rLDvMH2w36M_gNwdTLwwUHLfrZeXA=7-wpkasg3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 06.05.20 21:56, Fran=C3=A7ois Ozog wrote:
> Hi
>=20
> I have a running environment where I can create an inmate.
> Then I boot a fairly small kernel and try to do the same except that
> jailhouse tools are in a chroot:
>=20
> # cat /sys/module/firmware_class/parameters/path
> /lib/firmware/
> # ls -l /lib/firmware/jailhouse.bin
> -rw-r--r-- 1 root root 92168 Jan  1 00:06 /lib/firmware/jailhouse.bin
> # tools/jailhouse enable configs/arm64/macchiatobin.cell
> [10160.656599] jailhouse: Missing hypervisor image jailhouse.bin
> JAILHOUSE_ENABLE: Invalid argument
>=20
> (I am operating from a chroot environment and
> /lib/firmware/jailhouse.bin is there on the non chroot and chroot)
>=20
> Could this be because of the chroot ?
> The main environment is a busy box that have no libc... hence the chroot
>=20

Sorry, no idea. You will likely need to instrument=20
drivers/base/firmware_loader/main.c and/or kernel_read_file_from_path().

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9a209b64-4263-d08b-7dae-6d8e1871537e%40siemens.com.
