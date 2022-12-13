Return-Path: <jailhouse-dev+bncBDM3DNHKOAIJX4PBTQDBUBFTAJCTG@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883B64B5AC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 14:05:32 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id f20-20020a7bc8d4000000b003d1cda5bd6fsf2997954wml.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 05:05:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670936732; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ar1E2O9N1JW4rWS1I7tzkA15ZuxD93OwDWcG+AvWFVVE9uLipRVPQjdHc7AKH2h2H/
         u38CLtE8Mdk8PQJcEAo9pUDoylilTP8D59SXk+uHkSiU/UGYYSpgGVHRvn1wd/F2JCTM
         Rvp6C2wFLg1QPqImwgamiI+xCTfU01IjHbDF046x94wERZwPHPqzbh/cIFNlMWA71IlU
         xIfdcjvhi3G6Af8XV9aFxdp8ezb4f8v6Gpg0vvflor6mj+AkRAiHBIhxc4X94lfr+FJc
         37WW4yLukwmHf2HJ05fahlYLW3/hdaQL5UzhkzAjyz/+lFDYvZchwYH3CZcfLb3n98wq
         pB4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=NmDsX9xoPru2z9zlf8LYwjKPwGiZrrdM2xzFeNZzU8Y=;
        b=gABYSTl9RJfhYdyuwM707klDXmo4Aeqa/ssn8BxsciD7843ELKhyBYVjCXFI4W3N0a
         ccESVh6ZgmGOYy3Hwvp6v7hqfCiyEwC2OkLdgGrSD9O+dtf/M1gWVDL8vnWcIJBsuI17
         U/iIq2Lwq4czc7JToj+IO2MvC0/C2FCfKr7tlgpHBrEVGRxVrIw4cP5e9j3AUVoYCoYw
         Ki6IinrlRt1NG3k9xhtu3NY0n0LGaUvs/jKuBS1MjqWG4CQ6fE1ukF0kOujz2IJIwuuE
         PUfcs2TRBzGbp8quen9cqsFWAxqXzTsEfKP9Qm71LJFphBvyWp1/0irt4jU9191v9/n2
         +xPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jpajala74@gmail.com designates 209.85.208.53 as permitted sender) smtp.mailfrom=jpajala74@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NmDsX9xoPru2z9zlf8LYwjKPwGiZrrdM2xzFeNZzU8Y=;
        b=ADdWCTonNW3wf5/f4fawyUaA4vsuC5omVNcGLlfrmHEwGwf8Np0FUiyUHDOXsT3kkX
         a4bHgCiIywnhDatRZC0Odw2ggY3it5FFItbhgFCQK1gRRDP4Po0Y5FJbP1MOAkgZUVx3
         x3l4amNg8EKag10PMcFZ/zvpnGjpzSuuZUU0cz5rbHQx4D+NYj5mxDMk2d9ZifOtN+vB
         c16gphQKyTOuccRMF0UmVIKdB91miEKGHCZJ56lP376WjlZps3W9qJWo9Dtnsx4X6CyH
         4cQhd/Y4BUqV+qQqAamJmYDuz+rbYHZDJycHtjXJkFcZSEVneMjaeE83mhO1g+gMrUvk
         usnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NmDsX9xoPru2z9zlf8LYwjKPwGiZrrdM2xzFeNZzU8Y=;
        b=I9H/ywa7XZQZu0rdg9CBE1y2SxF2hBXcEGl8UW5Q4qEaFqG8G5tUKXyv2i/oVxJ8Z8
         lUa44ltP/Zveg07qNYzRhf1lfzzz7k/sPltn8amjAUBC0b34csg3WBUC4cGLD2qCSR/k
         ax8P6b895BrTaneeWOXDcxsRIyU3c9vCSZO4s+Qc5xFsJzKk8Y8F4b9WAeJwtpECDqTs
         l6SL9WCgB3YvLGFmMprNLH4VXBEcmKtw+tD6PeJOsc/GvEb3wmgZC96dQl4cbGvhHBGv
         uW75WT0g10GEb+I+h1GlksRc7tOF+PhC/iyW3ICwCLMGwAZhI2RYS5BGiiuXu4IaxwJP
         593A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plNU1j6Rlp4rrWMWL6HccZNMntXzKueguPHg483vv5ukR1YffWz
	Jli5u6T4KfWT4E5iXc858NE=
X-Google-Smtp-Source: AA0mqf4lqUErCLnaYH8qRSFsB7tpn16LDy/B6dRZnTBhyHgnYS+4A1E0YCqu1y8JNExPG6YLNXUgAg==
X-Received: by 2002:a5d:4085:0:b0:242:2113:b41c with SMTP id o5-20020a5d4085000000b002422113b41cmr25861154wrp.341.1670936731894;
        Tue, 13 Dec 2022 05:05:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:23b:b0:242:2700:8318 with SMTP id
 l27-20020a056000023b00b0024227008318ls11275352wrz.0.-pod-prod-gmail; Tue, 13
 Dec 2022 05:05:30 -0800 (PST)
X-Received: by 2002:a05:6000:80f:b0:24c:62c1:7e82 with SMTP id bt15-20020a056000080f00b0024c62c17e82mr11951222wrb.52.1670936730251;
        Tue, 13 Dec 2022 05:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670936730; cv=none;
        d=google.com; s=arc-20160816;
        b=sYhT95Gqj6p1dKUAqZ0YOXpMZmXZ05I9lvdyoBQDt2TumdqRkcNNdt0ZIV5S1suiL9
         fWUe5BjCnOydfnnrv37Ix2xVq655sn4aSWXOU25wyEjnTCrAOBsZ3+eFsLZLC3AF/Hf5
         t03NU6Ovoe9M9LWEVCXESs7RjlTYDU/6Ll3YFPB3AbkdhwgNVToDE80pcZ99CV2HxQCF
         6gSr8MsUavduM2PFpaN1dE/8419IrcN9MuHqQK1Uw1W0Cjn0inFSgJ547foflmbbCobD
         yWjBQ/WqjnFvIzIHbMoGoIJe5dv1wEj/QgIAg1g0KDo0dwJEeTAtMjI1FjFIrOk9ZoUz
         hqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version;
        bh=Oelx09BR/3Lwq/2ON7G3DP456GL5aXui1Dx8juK4efU=;
        b=tWGVzs/eyEkfM4xFytlR8f3KpFJRmFJv+Bg4ymR8AiMf1fggU2Wi08h+WCaJlhuju2
         yhLKlAGnGHVjenpGsQQA8WiYXs/Qf3bng8Vvbejmkxo11iikT/iZ3RyokUZcVoDKXPwU
         lD8hlTFK7rBjSEjixAZlUkB1gW3H4F90gmEP7QBdzCA5alDZ8U5KWT50CsV8ii+letwj
         UYBE7vBB8M+ATvHwQf/3Evu9JTkpfxUfO2+gICe7+bCCzpLAHbKHyYCzJIhYhJKnFptD
         ycA0BZFZI7buwOn+2K87tYorEl40H92yFu197WWh/Yr9Wc3Yo40lY5VTfwfqIiQon9yi
         pU/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jpajala74@gmail.com designates 209.85.208.53 as permitted sender) smtp.mailfrom=jpajala74@gmail.com
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by gmr-mx.google.com with ESMTPS id bj15-20020a0560001e0f00b002367b2e748esi605780wrb.5.2022.12.13.05.05.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jpajala74@gmail.com designates 209.85.208.53 as permitted sender) client-ip=209.85.208.53;
Received: by mail-ed1-f53.google.com with SMTP id d14so17568639edj.11
        for <jailhouse-dev@googlegroups.com>; Tue, 13 Dec 2022 05:05:30 -0800 (PST)
X-Received: by 2002:a05:6402:396:b0:46b:9c63:fa87 with SMTP id
 o22-20020a056402039600b0046b9c63fa87mr36007160edv.100.1670936729543; Tue, 13
 Dec 2022 05:05:29 -0800 (PST)
MIME-Version: 1.0
From: Jussi Pajala <jussi.pajala@iki.fi>
Date: Tue, 13 Dec 2022 15:05:18 +0200
Message-ID: <CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6eQ@mail.gmail.com>
Subject: Jailhouse on TI AM5728 and 5.10 kernel
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000034e90b05efb54662"
X-Original-Sender: jussi.pajala@iki.fi
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jpajala74@gmail.com designates 209.85.208.53 as
 permitted sender) smtp.mailfrom=jpajala74@gmail.com
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

--00000000000034e90b05efb54662
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm currently running old jailhouse 0.8 on 4.9 kernel - provided by TI's
SDK.

Now, I need to upgrade to 5.10 kernel but TI has removed Jailhouse support
from the newest SDK which contains the 5.10 kernel.

The old Jailhouse doesn't compile under the new kernel. Also I saw some
posts that the kernel requires some patches for the Jailhouse to work.

So, what is actually needed? What are the steps to configure the 0.8
Jailhouse to compile under 5.10 kernel?

BR,

--Jussi

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6eQ%40mail.gmail.com.

--00000000000034e90b05efb54662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m currently running=C2=A0old =
jailhouse 0.8 on 4.9 kernel - provided by TI&#39;s SDK.</div><div><br></div=
><div>Now, I need to upgrade to 5.10 kernel but TI has removed=C2=A0Jailhou=
se support from the=C2=A0newest SDK which contains the 5.10 kernel.</div><d=
iv><br></div><div>The old Jailhouse doesn&#39;t compile under the new kerne=
l. Also I saw some posts that the kernel requires some patches=C2=A0for the=
 Jailhouse to work.</div><div><br></div><div>So, what is actually needed? W=
hat are the steps to configure the 0.8 Jailhouse to compile under 5.10 kern=
el?=C2=A0</div><div><br></div><div>BR,</div><div><br></div><div>--Jussi</di=
v></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6e=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRK=
eyieT6eQ%40mail.gmail.com</a>.<br />

--00000000000034e90b05efb54662--
