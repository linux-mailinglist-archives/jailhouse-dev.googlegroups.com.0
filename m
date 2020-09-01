Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBQHVW75AKGQE3V73XOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F8258963
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 09:39:46 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id p43sf326588qtb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oBSTdCYiWfkKducmWJ02qAh0UNjBaEC49uDukmzdNJY=;
        b=TVDX1OQSPrWaTTwtto1TqdY/mGvLETn8YNMeV9w4N7dh3F34p6KbkDxeFnqadRa1Vh
         +N6KX3q/K7FBfgxNIlmlhvUCBkZBkkhiGJLv1ZxLvie+OMEwkKWspEPtIv2mnOlosKvs
         yCaroHSgjzpA5ANBVGhgkDl2ZvT25z9Ju1x/N50ibUfAUK4Ptx1r8LWDtqwDWUyI820c
         FAP0HME0KxGfhLY87ReUK5vHhr4BwxvAR4a9Tt+Qzrh/Jh4FdEK247/GtS8/QjIV/pf5
         TVmEveE7nWZMIhjx1/qbiH+gybTTo3YVspHsF1Hep4zkzAky/Qf+ktK987zLIyzTQv8P
         3voA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oBSTdCYiWfkKducmWJ02qAh0UNjBaEC49uDukmzdNJY=;
        b=P04X1Vam9JiObEBTT2FkaNuA7Rz3AM77XD3l0CRb7uQC5485QM7ySEjfvcdpwPGdXx
         BoWGQ902XyQcliYZoqqvfUBESFGqzhyugqwUoavsDpoYqAbrstTo9XuDcbAALpqbPLfL
         bLCGkfn97f6o8XIVlTj0YsjdhUDCVEXw4QGrVWMjj/i9IhbbgoduhqGFCFr3SAaluiBq
         2R1W539qljCCbZAishagGEvBIv5p/FbSGh3n6EvV6POVznnh5jNxPSInB2/xIuoYD+p1
         Ayo4+Ul+kiEtBa7Np9Yf/6OFHFZ4FYA0fBATt5ikVaNvYmzBdlyoFyS3COJgo+UTihmI
         vDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oBSTdCYiWfkKducmWJ02qAh0UNjBaEC49uDukmzdNJY=;
        b=bzSXvLKpAJ4UGD5A0DWueXxbxeikQuTDaKrLVHMlCdDbQhIVDn68Nl54Yqo9YoOkPe
         mEs0MdyeynynJvXnBTfT5kB8XsAvIVBqToMsRdEAEcrtEOC18tYm/ye7Y5tobwPwzpYF
         WJIWLpy14g4c3VlCKHgMWz9jyRMAo6oUVWTh/lP6/J2AWvOpDBrDAItMxbT0W7+6U+ZE
         724p7BMqOXtUrxhWpCS/Blw5tOeFIZ4QLgUVWWFSINQutiErNJp0nFWt2kunbeM5wxUQ
         EzEXITQms+VtMUx4SvStxOPb6OOtfDOVOJ2NyLzleki1jHgZeTbFYZbe6Gy2japQ/XOD
         J1sg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533n+2YFNrbaVC02muwwl9Cl9QfMq+vd9phA3/uZHrOg6U1xTpdl
	LO0ZVhmhFELFKLTCrYwco5Q=
X-Google-Smtp-Source: ABdhPJz5VGoHuNdxafceRVdhpHleVhCTrNLU6wX9f04as0PrLS8yYYjpYr/+WlpRWVx4JFkF+bDh+Q==
X-Received: by 2002:a0c:8d4a:: with SMTP id s10mr672969qvb.34.1598945984716;
        Tue, 01 Sep 2020 00:39:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:24ba:: with SMTP id t55ls168757qtc.8.gmail; Tue, 01 Sep
 2020 00:39:44 -0700 (PDT)
X-Received: by 2002:ac8:71cb:: with SMTP id i11mr485184qtp.108.1598945984093;
        Tue, 01 Sep 2020 00:39:44 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:39:43 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
In-Reply-To: <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_236_790714071.1598945983153"
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

------=_Part_236_790714071.1598945983153
Content-Type: multipart/alternative; 
	boundary="----=_Part_237_1760417252.1598945983153"

------=_Part_237_1760417252.1598945983153
Content-Type: text/plain; charset="UTF-8"

Hi Jan!

Thanks for pointing out the Yocto recipes!
I have now added "jailhouse" (V0.12) to my image and the kernel module 
"jailhouse.ko" is also loaded.

Unfortunately I now have another problem:
When I execute the command "jailhouse hardware check" I get the following 
error messages:

Traceback (most recent call last):
  File "/usr/libexec/jailhouse/jailhouse-hardware-check", line 130, in 
<module>
    pci_devices, _, _ = sysfs_parser.parse_pcidevices()
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
289, in parse_pcidevices
    d = PCIDevice.parse_pcidevice_sysfsdir(basedir, dir)
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
900, in parse_pcidevice_sysfsdir
    caps = PCICapability.parse_pcicaps(dpath)
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
783, in parse_pcicaps
    (id, version_next) = struct.unpack('<HH', f.read(4))
struct.error: unpack requires a buffer of 4 bytes

(python3: 3.7.7)

Unfortunately, I don't know about Python at all.
What could be the reason for this?

Best regards,
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/629cee36-86a7-4239-a997-baa2d165f08dn%40googlegroups.com.

------=_Part_237_1760417252.1598945983153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Jan!</div><div><br></div><div>Thanks for pointing out the Yocto rec=
ipes!</div><div>I have now added "jailhouse" (V0.12) to my image and the ke=
rnel module "jailhouse.ko" is also loaded.</div><div><br></div><div>Unfortu=
nately I now have another problem:</div><div>When I execute the command "ja=
ilhouse hardware check" I get the following error messages:</div><div><br><=
/div><div><span style=3D"font-family: Courier New;">Traceback (most recent =
call last):<br>&nbsp; File "/usr/libexec/jailhouse/jailhouse-hardware-check=
", line 130, in &lt;module&gt;<br>&nbsp;&nbsp;&nbsp; pci_devices, _, _ =3D =
sysfs_parser.parse_pcidevices()<br>&nbsp; File "/usr/lib/python3.7/site-pac=
kages/pyjailhouse/sysfs_parser.py", line 289, in parse_pcidevices<br>&nbsp;=
&nbsp;&nbsp; d =3D PCIDevice.parse_pcidevice_sysfsdir(basedir, dir)<br>&nbs=
p; File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", lin=
e 900, in parse_pcidevice_sysfsdir<br>&nbsp;&nbsp;&nbsp; caps =3D PCICapabi=
lity.parse_pcicaps(dpath)<br>&nbsp; File "/usr/lib/python3.7/site-packages/=
pyjailhouse/sysfs_parser.py", line 783, in parse_pcicaps<br>&nbsp;&nbsp;&nb=
sp; (id, version_next) =3D struct.unpack('&lt;HH', f.read(4))<br>struct.err=
or: unpack requires a buffer of 4 bytes</span></div><div><br></div><div>(py=
thon3: 3.7.7)<br></div><div><br></div>Unfortunately, I don't know about Pyt=
hon at all.<br><div>What could be the reason for this?</div><div><br></div>=
<div>Best regards,</div><div>Jan.<br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/629cee36-86a7-4239-a997-baa2d165f08dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/629cee36-86a7-4239-a997-baa2d165f08dn%40googlegroups.co=
m</a>.<br />

------=_Part_237_1760417252.1598945983153--

------=_Part_236_790714071.1598945983153--
