Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBXUV3X5AKGQE6IE4L2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF9260E5E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 11:11:59 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id ff20sf8781148qvb.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BgnXmEGLsze1cjLn2s9cF/40Rv7e9x9YmZdPryvJZXg=;
        b=cpP9ET1ORNnY8J4gUqMKQoS4v/ddYDmHH77NH6rcXALbNn1QnX5cGu3tHtuaJW44t1
         oAE4CGxzAqVWl2C824vsjDJoyVgcjI+oxlS1yZ3YAyBptjIsBfjBOxrvLY6R90ypoA+1
         K4p3eN+QOIQcimGNG1F5T1sSBAs2nADL34VO+/OhlAq8wG9CkdouCqHba3WRxMVMsh7g
         wpFPmfZ7a9Fl4gXBgSNuwHlK5yxFEy7XY7jBGaLoZTw4OYUWHD9OMM7xYr1KKcwbZjDZ
         amqu71H/3dkkrv6aNbEkqn0BaIIB0UdMR5wLT5JT/WWQCKPMJkKXDZq4oT5rH32JkfSZ
         S9Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BgnXmEGLsze1cjLn2s9cF/40Rv7e9x9YmZdPryvJZXg=;
        b=f9o5cNNaYDGDBf/CSANvMiuq9/eBxKPHhOxbmfsqD1SiESYV6uZQOh8ZfahBV04acN
         fJmWKLGTVaCciY9ytPrzmgmwKALJLrwfhDDrJkuHzaqIGAVIFqALR+SezVtpzMXfzYCQ
         VGd5pDDry8T85Mqa5fnztoN0krB5H/S4CEkqqNkOQsOkK7WNpjU2CDSRBovTG0Pf0d+x
         E2bPMvTIGLPt+6ayagD+zwpN0h8vsHBYe3FFR0sgPe4hAOw39fiIUyez8FZ3twoI1JF2
         fMibtABVkeEuXrKkNShuINrfsXwKCymiy/bnmGBxewoubWEK2zOWen32vot1dJnXXMRV
         RSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BgnXmEGLsze1cjLn2s9cF/40Rv7e9x9YmZdPryvJZXg=;
        b=fVZgq8U3VT2bWOA9vAg3GVVfRLB/26uXd1k1pvA4LXoH4xtOxVG4YUqIQSuNJkhKDT
         rZXeop4LgFa0/fRrSzA2lmH8CZYHxaDrzxFc9etpv4jAImm9lhBq48e2KpF7pUsMv/a2
         6bCE4cxMWmD9bBzdyqYZQFhHIFZMpsdEsA9EnIPn+UxRN0vDw3eORyL6rhESWwzel/8K
         qW49ZV+zv/E0/LZz1YXWrjS59sj50BcYSwUTZoHmMSEca7+wsMIesaYDj6GMipDiyt5+
         JehYiK6qK+/ryuE7Zi/5FhSNmV5cP+2wDQi03sdrUgZk4ywTt0Awk1o+SS/oKXcvIQzr
         j/xA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bbLEUeIv2NYPCrRhqt7WUj1/6nxDh6pJ8Leztp9BzHwI4EqyJ
	7cCCvR943szSOcBcJhqDYqw=
X-Google-Smtp-Source: ABdhPJycIIqfR7FQ3+OTBf9qNiKS07jvR8rd+swjiWHuzFlbEljw6m8WFEMiuba3rYeJ6Lu5M7j9Ew==
X-Received: by 2002:ac8:6f3b:: with SMTP id i27mr17576464qtv.299.1599556318577;
        Tue, 08 Sep 2020 02:11:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:22ca:: with SMTP id g10ls7464538qta.3.gmail; Tue, 08 Sep
 2020 02:11:58 -0700 (PDT)
X-Received: by 2002:ac8:1789:: with SMTP id o9mr22874950qtj.351.1599556317930;
        Tue, 08 Sep 2020 02:11:57 -0700 (PDT)
Date: Tue, 8 Sep 2020 02:11:56 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
In-Reply-To: <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_906_1699167142.1599556316918"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_906_1699167142.1599556316918
Content-Type: multipart/alternative; 
	boundary="----=_Part_907_1362251198.1599556316918"

------=_Part_907_1362251198.1599556316918
Content-Type: text/plain; charset="UTF-8"

Thanks for the hint!
How do you know if you aren't the inventor of the hypervisor?
So it is extremely difficult to use jailhouse!

Just for clarification:
Is the Linux kernel for the root cell always started with "intel_iommu = 
on" and the kernel for the guest cells always with "intel_iommu = off"?
Or is the linux kernel always started for both the root and the guest cells 
with "intel_iommu = off" and only for the creation of the configuration of 
the root cell exceptionally with "intel_iommu = on"?

Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/276eb4de-5351-474f-a8ae-a0a038056c78n%40googlegroups.com.

------=_Part_907_1362251198.1599556316918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks for the hint!</div><div></div><div>How do you know if you aren'=
t the inventor of the hypervisor?</div><div>So it is extremely difficult to=
 use jailhouse!</div><div><br></div><div>Just for clarification:</div><div>=
Is the Linux kernel for the root cell always started with "intel_iommu =3D =
on" and the kernel for the guest cells always with "intel_iommu =3D off"?</=
div><div>Or is the linux kernel always started for both the root and the gu=
est cells with "intel_iommu =3D off" and only for the creation of the confi=
guration of the root cell exceptionally with "intel_iommu =3D on"?<br></div=
><div></div><div></div><div><br></div><div>Jan.<br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/276eb4de-5351-474f-a8ae-a0a038056c78n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/276eb4de-5351-474f-a8ae-a0a038056c78n%40googlegroups.co=
m</a>.<br />

------=_Part_907_1362251198.1599556316918--

------=_Part_906_1699167142.1599556316918--
