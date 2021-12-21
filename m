Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBXMXQ6HAMGQEXV35HGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135647BFEA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 13:43:10 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id g15-20020a0562141ccf00b003cada9e7e2fsf12612032qvd.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 04:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ytsTiDrorrU5NghLqBGhRD62WjehWKF6DG/THyIXtRc=;
        b=fwgc4kjaCHEz+sGNCJpAI7JyERRRJVKwwa9/zyRl4dNKe7JJMNZamlJHL3LLq38l9r
         PcpJxoKZkmSD6+gf/4ffUP3Maig+Ui7VlHU1CFAVoLicfG4uyQr7X+lQJqbLYcTJrwty
         ymBVVxeFtYIKBRw6nrIRYmmproJiZcQ8fiYfXV7MmYnGwAc/Te8I1WbnunRFzNaqYbKE
         ehCDSXJA+6QEZwX3w+MnV1xZJYI0RJQSZAHSkcGFLALxHTPKvv1Ug0/bG5ntBFq9djbd
         Z/HR94WmC2ozN2+zWcHcTE3wV92symrEFbvE6uDZcEOEnc2vHIcfS2MhvS6R7qFi8V2V
         xeCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ytsTiDrorrU5NghLqBGhRD62WjehWKF6DG/THyIXtRc=;
        b=oqc5GesgYuWHenMXvrShCkTvlTYPLid2Uc1yAg8HdwxJZGXhDFyxbdY3kzd/MIEAYL
         d0RZ/ghzXjP5oOAmslp+jyT2/a49k3FBNjG12VRUoW8s9ncnTBzvR1EB33nXcMwzhFVV
         GilDMFNlh8GVoP32DFkdmsmgR+mjpq266qftJuZD4dAARDJKHky3h/W7B5ZAD9PmYL6a
         DplEhSK68rjNMsAFAcgJqxcsYjXS0K8uq7JbO3VW4C0QYMNBnoke0+yHaqbqyZD6H+V8
         oX/CKsrHDewb0WKu7l9jusD9kcMqBlrjUr/GeSE2y+qbHWKT2Ol+2sMh1MtQ6zEZwrKB
         3Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ytsTiDrorrU5NghLqBGhRD62WjehWKF6DG/THyIXtRc=;
        b=0burCPu7rW64HS7Flt/4r5wBlkXTG7NDPoGz3YTQsRzlSzptQk56Gw1nxuyl2b5XXC
         oEoKXw7MI+cLcKRVbP9SWzdXM1SxkH/z/JSVR58xcYLZx9ujrBtDpPhxoeo0/jfRn512
         pArOxJfCZb9Kw9JugTInRtlmhQbj8QiPBkTVM+QBRHT3fnmJVfoqW17kSdvm2lnllU7b
         5tbHka/qHY/Q1WUA5X+CKUtB3xE8q1TDhQBeqrXVya5DG39chenG+0WVgODUZ8jOtXyS
         OSRbc/7px3ye4tZV/l9JZuD0Od2Tt16sc1qGzKE3Jo/VQ68mHmOQFFrNZQTBIxNH95ML
         0C8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533YSZxiMKdu6QjB5lbGvmBlhL4W8g+okKGDgS9jvXEj7V/is89e
	+glHCZvPgamVTUT3Lo1bcwE=
X-Google-Smtp-Source: ABdhPJwuovWZpr4E1vYJGjNVsKcItzGhKwiSaxXU4Qobhmv68aFruG6Po2Z/9+/uFm7eHQy/B98E+A==
X-Received: by 2002:a05:6214:da7:: with SMTP id h7mr2220320qvh.99.1640090589209;
        Tue, 21 Dec 2021 04:43:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b3cf:: with SMTP id b15ls5054822qvf.1.gmail; Tue, 21 Dec
 2021 04:43:08 -0800 (PST)
X-Received: by 2002:ad4:5d65:: with SMTP id fn5mr1977987qvb.10.1640090588711;
        Tue, 21 Dec 2021 04:43:08 -0800 (PST)
Date: Tue, 21 Dec 2021 04:43:08 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
Subject: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8764_518335703.1640090588134"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_8764_518335703.1640090588134
Content-Type: multipart/alternative; 
	boundary="----=_Part_8765_937930010.1640090588134"

------=_Part_8765_937930010.1640090588134
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,
When I tried to add two ivshmem PCI devices to the root cell, a "FATAL:=20
unsupported instruction" bug occurred. This bug is caused by=20
x86_mmio_parse. How can I fix this bug? Below is my root-cell configuration=
=20
and log output from the port.

thanks=EF=BC=8C
 Jiajun

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/de30fff2-ed9d-4a83-8229-6cfd9a2ac99an%40googlegroups.com.

------=_Part_8765_937930010.1640090588134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,<div>When I tried to add two ivshmem PCI devices to the root ce=
ll, a "FATAL: unsupported instruction" bug occurred. This bug is caused by =
x86_mmio_parse. How can I fix this bug? Below is my root-cell configuration=
 and log output from the port.<div><br></div><div>thanks=EF=BC=8C</div><div=
>&nbsp;Jiajun</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/de30fff2-ed9d-4a83-8229-6cfd9a2ac99an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/de30fff2-ed9d-4a83-8229-6cfd9a2ac99an%40googlegroups.co=
m</a>.<br />

------=_Part_8765_937930010.1640090588134--

------=_Part_8764_518335703.1640090588134--
