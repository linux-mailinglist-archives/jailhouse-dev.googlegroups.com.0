Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB45G335AKGQEQ67OQ3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id F396C261289
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 16:21:40 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id p43sf10599130qtb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5Uh9aw7emR2+7nFub6DQg9Yw12g8PCrKu86qB3XVv6w=;
        b=B+smj8So2Jmxq8yqnqnkRS30Uqv60ZgfeFDSOKxllO9w4Ae1k8T6JW5cChpnh0NbmR
         /2veVFqs6FbDNMxitEEsjmobabOpJe4j6L8Y+1NCjOGTzavCEkhUTohNeDlsvh1X3ElT
         8/2q/F7tMYLGFUQxhbsbLu1x02Rhh8RtW2CN1JN15zV6CDA1KM6s1IaDQ3BeTU3jpouN
         9ubloEtnnuN0puE0QNrFtnhM5bygFxeCqro+tRiQbo09MVUeWfa/R6FF9ARUtNkinjZC
         dX2oDhDVmGEysl6BPbhVjYqZLorIoyUvbDX8dOgUGsq1urAEkdDRdznH4Ouwekem9oFb
         utnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5Uh9aw7emR2+7nFub6DQg9Yw12g8PCrKu86qB3XVv6w=;
        b=jNMLadGUSuTAUfNvmS59oY71eYo8z7YhcZtaSoFB9VH0D4yruYO1DEaaXVaqTUFJQe
         aB0qmYGIPk/mcaHc2LHaWNh10kT3Uqu3XFWmfz89Dxj8V3PZ3FonAoMb5866qidv5Gsl
         dqPkIs8lFe9euCtVTb/zN8l9xBpFPjQOWAbSqAf7vAD+jWi50dXlwmzuuFGIwAh/FVGF
         pbjaCp5iW2jzFdariqNwXRuJWIEsP7faTsI0cCmEHRddLmVGXcYNfE6dIXdtBN5QfBSu
         tgC3ZMUMHipsry4HDUc3B227SH7ioOMV0VA/UFqU+vMTbe4k87rk8iqoDkizyL394mOc
         iXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5Uh9aw7emR2+7nFub6DQg9Yw12g8PCrKu86qB3XVv6w=;
        b=PHVrtJQrSXix5CLRh5WqpiQZ6KbZyoAXNK9AK9KF8/k9VExJdMXqZOUgsFUm6DcfZr
         brHc++gkq2b5wvmc1dZgeJ0esK6ZV6sWuUqGrtUmY9CZCTCoAOTw27ZJIlnh6X2KUJcj
         mESKKuQdQalXUeBbV8X5CU550mOEUlZCmGjzdkuRNs3avTEAC+p5bOrMWf/6hdPmc/BG
         A9tWLWB173M3EKzAe4e6iR+JDp+DycDkGdVWv3UCNHnzPidV9VNW0lS2t4ixMLVO+JYU
         9SQlQZinV8xiAS1G7Qt344f35SQUf77FlPmNqQnBmc8lfw4HO9aK3ppe8FvqPqVEg6G0
         29eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Aan+Ros3BW4dRdEEWqRwzxxXWUOPH2ws6skAt1Zgy7CGrb+r1
	CI/2Jap7oStFsCihaT7KuUU=
X-Google-Smtp-Source: ABdhPJy3PNPt7d+pEsqVYwvOYDbrKi2iaVf/44FE3fVQ7LpFWD1L6DKt5oKBKDLIfIX+RmW9eALSpQ==
X-Received: by 2002:a0c:de0e:: with SMTP id t14mr290318qvk.57.1599574899675;
        Tue, 08 Sep 2020 07:21:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:3405:: with SMTP id u5ls7782946qtb.1.gmail; Tue, 08 Sep
 2020 07:21:39 -0700 (PDT)
X-Received: by 2002:ac8:23a3:: with SMTP id q32mr240600qtq.361.1599574898598;
        Tue, 08 Sep 2020 07:21:38 -0700 (PDT)
Date: Tue, 8 Sep 2020 07:21:37 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
In-Reply-To: <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
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
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2770_1458572847.1599574897554"
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

------=_Part_2770_1458572847.1599574897554
Content-Type: multipart/alternative; 
	boundary="----=_Part_2771_1168244838.1599574897554"

------=_Part_2771_1168244838.1599574897554
Content-Type: text/plain; charset="UTF-8"

Now I'm using "linux-yocto" for the kernel with "linux-yocto_5.4%.bbappend" 
and all patches and the configuration fragment "jailhouse.cfg" from 
"meta-agl-devel".
This builds Linux Kernel 5.4.61 with Yocto/poky "dunfell".

After building the kernel and exploring the resulting kernel konfig 
".config" I can see, that only "CONFIG_IOMMU_SUPPORT" is set; 
"CONFIG_INTEL_IOMMU" is not set!
All other configuration options from the configuration fragment 
"jailhouse.cfg" are set except "CONFIG_PCI_HOST_GENERIC".

Should this configuration work for "jailhouse"?



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0cf9a640-02d0-4928-873e-08d407bbed17n%40googlegroups.com.

------=_Part_2771_1168244838.1599574897554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Now I'm using "linux-yocto" for the kernel with "linux-yocto_5.4%.bbap=
pend" and all patches and the configuration fragment "jailhouse.cfg" from "=
meta-agl-devel".</div><div>This builds Linux Kernel 5.4.61 with Yocto/poky =
"dunfell".</div><div><br></div><div>After building the kernel and exploring=
 the resulting kernel konfig ".config" I can see, that only "CONFIG_IOMMU_S=
UPPORT" is set; "CONFIG_INTEL_IOMMU" is not set!</div><div></div><div>All o=
ther configuration options from the configuration fragment "jailhouse.cfg" =
are set except "CONFIG_PCI_HOST_GENERIC".</div><div><br></div><div>Should t=
his configuration work for "jailhouse"?</div><div><br></div><br><div class=
=3D"gmail_quote"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0cf9a640-02d0-4928-873e-08d407bbed17n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0cf9a640-02d0-4928-873e-08d407bbed17n%40googlegroups.co=
m</a>.<br />

------=_Part_2771_1168244838.1599574897554--

------=_Part_2770_1458572847.1599574897554--
