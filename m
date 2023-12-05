Return-Path: <jailhouse-dev+bncBDDNLC7ZXEFRBM6AX2VQMGQEH6YFXSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-f55.google.com (mail-qv1-f55.google.com [209.85.219.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09A806176
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Dec 2023 23:12:05 +0100 (CET)
Received: by mail-qv1-f55.google.com with SMTP id 6a1803df08f44-67abf4618a2sf4714946d6.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Dec 2023 14:12:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701814324; cv=pass;
        d=google.com; s=arc-20160816;
        b=VQT0GfIaVec7u0MqJH/EZGr1OIjWbHbr6WV0uh3AyH54lgNawm5nBFVcZDyAl4rM+4
         3cisGGGAGDXqKIxSE/W+SAi2BS6a3wm1gUnRG+VBdnc0CB1Hk723crMEyvxqEU8W1MoR
         Jp17RvUzn7zeJZbQWDu1IUUFajHUYULKZm/L5fpVO+RfbK7YEs71pXHadZvgxUQYUgjZ
         MC6sPaY+uK579DDhFnu71ZPZoRqMz1Zge54fAEey8yAX0Qfb/hnL7DwkVitDL2bjJ5tg
         K18fnlNJ+hir/us2iYQghTZoWlfKzZoRhI5fl3adARHG520rg2y81vOkP2kUuYRpHNIE
         40Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:from:subject:sensitivity:sender
         :message-id:to:mime-version:date;
        bh=phdRnLYui4xTLsqWh3j/LtSxWq9vB+AM51xoPwEqne4=;
        fh=9Xx/yXSLyUm6ZeIPqF7J7BYOgWNFg2X3nSXkVvIo4MM=;
        b=yQw/lIBEMSpA5BPQA83ZDNUyWHJXYup8PvZX8JeNwZvIATTsKHndxsj10MOLyC8k2F
         tpCK7RpoCd/8CVSrkp/kx5F6VVRB7XcKCn6CZT84toxDfoKLsoFkrzIj5WjaEC7klD5A
         03WGycH/ukROjki4gGeHq3HM8KrLVE0rxHrA8bvT9qVfa+p/vuq/UQowyDH5VeX7Tc2s
         TFAm7aWuVJx7r/mGwaJwJkeViaGeGioJ86BfzP5VALHvQe+exx3MSl5NFbXR+v+nH5pO
         3Je7P6p72n2+AHXacLxHxTYf7emyQFBKDmFIHYYqc26qjmphUjJSh3nam1St1Cv3HHQy
         OECg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@rediffmailpro.com header.s=epro header.b=DVOAlgB9;
       spf=neutral (google.com: 119.252.152.37 is neither permitted nor denied by best guess record for domain of myinfo@hpfc.net.in) smtp.mailfrom=myinfo@hpfc.net.in
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701814324; x=1702419124;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:from:subject
         :sensitivity:sender:message-id:to:mime-version:date:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phdRnLYui4xTLsqWh3j/LtSxWq9vB+AM51xoPwEqne4=;
        b=lXUAIuzdDKptTnmdkFAUjl4DiJbSUuXC/xr0jHO4qYts8dEwiBSmhrZ9TSLbwvoSbV
         FvsDYl+ZyFAL3/T8rujLZ1ubDwo6oZEhjsq2K3fUS2rfVIVnFqRWydxFK6N6L2ACvSXs
         ITzhjAw7+Da20wWL0q9mSjAZa/wn8MyaV4ja3viu/QmDsj/n968kpZlfUnqaPWE+GvJB
         lnAMaX3OslcNQOBG/7Z8XKpyuE0vwZ07SQMpFxHgSuGHdTquL0tn3eA0MNEnNsEI2aiK
         o1lZLOFBvORPMgvCHF9QmXuxJcKR4PGgW9QRjZ2HtBi9bmO9N4PxqQmtFVi6Q/+jsoQ9
         MYrA==
X-Gm-Message-State: AOJu0YyucUD/GoVm2dB0kYvvTii/4JOwJ/XN4eK+9tgZ+7pkw+X7Jbx0
	QN5umCnTOGdgQ5wvInxrnho=
X-Google-Smtp-Source: AGHT+IGGuxtsm2iPAxXeVPtfG8vTxHjeYT96qraGMfavVoMRC07OeTpkafGW7UrMSrR6c64rwKc8KQ==
X-Received: by 2002:a0c:fd8c:0:b0:67a:bb12:d538 with SMTP id p12-20020a0cfd8c000000b0067abb12d538mr2789713qvr.22.1701814324533;
        Tue, 05 Dec 2023 14:12:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:18f4:b0:67a:9b35:cc14 with SMTP id
 ep20-20020a05621418f400b0067a9b35cc14ls753928qvb.2.-pod-prod-00-us; Tue, 05
 Dec 2023 14:12:03 -0800 (PST)
X-Received: by 2002:a05:6122:4205:b0:4b2:c573:ed5b with SMTP id cm5-20020a056122420500b004b2c573ed5bmr1995864vkb.13.1701814323327;
        Tue, 05 Dec 2023 14:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701814323; cv=none;
        d=google.com; s=arc-20160816;
        b=KJPvQXAyT4WOpIil/0wXm0gYAfsXfwstREBNeBV+/ZbmXAXWMiG5mtiyVVzaG+o3SJ
         q+g3j88kBozVuFJe3y06A9Uj4bfxz6ZRkL7bLSCVnUUsFI+1dbFIEA2TdEh46iU5erue
         Owyaky5P15AHGcfHdJClQy50gB9FHMzkGaPbexN9s0Ac1pZmiZH70dn6f1icDi7nalrq
         J9Eq6pVLEnUxD9WJetNVVTUP8xQEIvLyLX2JdgHqWze3RKufube+Wxjdj+HK1lgM8rxO
         Z5MUkeQlM0wJ9k9KXfZ+2efo/DJAxzKB+OFXnSsP9ST+CY40sazpvGkUgR6DgH9QueaY
         6qyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:subject:sensitivity:sender:message-id:to:mime-version:date
         :dkim-signature;
        bh=6P461g3erQoc5VYRVSXoaYgIggfD+0LMyuXlFDH9gx4=;
        fh=9Xx/yXSLyUm6ZeIPqF7J7BYOgWNFg2X3nSXkVvIo4MM=;
        b=Y0y+EapmJAyfXLCZdR1Yk5vnnZs7+vRKRM2HdI+DaEKYPUUGDpjHtWdnJgzEempA2w
         V+8s8twY3v7VJq6qCilOhXG+ORxayLAP5afcASGIJXo+MG8MITT3cPAetbox7FR7B6J7
         BBi0Gng0Nv1bmE+QGT8JCRAV1mrQTB7qaH8MIeH6JCv7ucTKC1IeIzARHtq62lUG5vHg
         s2emBOy2GzgJ/HxP0MVBX6cu9kUNYKmlozIfcisASs10rr9YQzPrCwsNlYoPtL1M47Bn
         Chk4dnvszG3cRYQ0OHRRzjtZ6p/22cIKiY9ZcW0vf3acUyEIf9G4vnDt3Z5zfVxWz4Js
         vyPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@rediffmailpro.com header.s=epro header.b=DVOAlgB9;
       spf=neutral (google.com: 119.252.152.37 is neither permitted nor denied by best guess record for domain of myinfo@hpfc.net.in) smtp.mailfrom=myinfo@hpfc.net.in
Received: from pro.mxout.rediffmailpro.com (pro152-37.mxout.rediffmailpro.com. [119.252.152.37])
        by gmr-mx.google.com with ESMTPS id bq6-20020a056122230600b004abd0f58a5esi810479vkb.2.2023.12.05.14.12.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2023 14:12:03 -0800 (PST)
Received-SPF: neutral (google.com: 119.252.152.37 is neither permitted nor denied by best guess record for domain of myinfo@hpfc.net.in) client-ip=119.252.152.37;
Received: from pro-230-105.rediffmailpro.com (unknown [10.50.252.5])
	by pro.mxout.rediffmailpro.com (Postfix) with ESMTP id 600911E35DA
	for <jailhouse-dev@googlegroups.com>; Wed,  6 Dec 2023 03:41:59 +0530 (IST)
X-REDIFF-Delivered-Remotely-To: jailhouse-dev@googlegroups.com
Received: (qmail 23640 invoked by uid 510); 5 Dec 2023 22:11:59 -0000
x-m-msg: 9f4a03dc747458a132a3dedaf719a754; a6da7d6asas6dasd77; 5dad65ad5sd;
X-OUT-VDRT-SpamState: 101\PHISHING
X-OUT-VDRT-SpamScore: 300
X-OUT-VDRT-SpamCause: "gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucftgfffkffhhfenuceurghilhhouhhtmecufedttdenucgorfhhihhshhhinhhgqdfjohhsthculdeftddtmdenucfjughrpeffggfvkfhsuffhtgesrgdtreertddtjeenucfhrhhomhepfdhinhhfohdrrggumhhinhdfuceomhihihhnfhhosehhphhftgdrnhgvthdrihhnqeenucggtffrrghtthgvrhhnpeefgfegkefhgffhtddufffhueeigeffjeeffeevkedvueefleeggeduhefgtdeludenucffohhmrghinhepihhmqdgtrhgvrghtohhrrdgtohhmnecukfhppeekledrudegledrudehrddvheenucfuphgrmhfkphepkeelrddugeelrdduhedrvdehnecuufhprghmkfhppfgvthifohhrkhepkeelrddugeelrdduhedrvdehnecurfhhihhshhhinhhgjfhoshhtpeiffiifrdhimhdqtghrvggrthhorhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmhihinhhfoheshhhpfhgtrdhnvghtrdhinhdpnhgspghrtghpthhtohephedprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhvmhgrrhhmsehlihhsthhsrdgtshdrtgholhhumhgsihgrrdgvughupdhrtghpthhtohepjhhulhhivghnrdhthhhivghrrhihrdhkuggvvhesghhmrghilhdrtghomhdprhgtphhtthh
 opehkuhhnihhtqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehlihhnuhigqdhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhmohguvgepshhmthhpohhuth"
X-Dedup-Identifier: 1701814319_23638_23637_pro-230-105
Date: 5 Dec 2023 22:11:59 -0000
MIME-Version: 1.0
To: <pgaj@cadence.com>, <vitor.soares@synopsys.com>,
  <linux-i3c@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
  <haren@us.ibm.com>, <leitao@debian.org>, <nayna@linux.ibm.com>,
  <pfsmorigo@gmail.com>, <tyreld@linux.ibm.com>, <brking@us.ibm.com>,
  <lijunp213@gmail.com>, <cforno12@linux.ibm.com>, <seroyer@linux.ibm.com>,
  <mikecyr@linux.ibm.com>, <ptyser@xes-inc.com>, <max@enpas.org>,
  <linux-ide@vger.kernel.org>, <ike.pan@canonical.com>,
  <o2g.org.ru@gmail.com>, <yotam.gi@gmail.com>, <jhs@mojatatu.com>,
  <pmeerw@pmeerw.net>, <castet.matthieu@free.fr>, <stf_xl@wp.pl>,
  <siglesias@igalia.com>, <jens.taprogge@taprogge.org>,
  <industrypack-devel@lists.sourceforge.net>, <harveyhuntnexus@gmail.com>,
  <dmitry.kasatkin@gmail.com>, <adaplas@gmail.com>,
  <cezary.rojewski@intel.com>, <liam.r.girdwood@linux.intel.com>,
  <yang.jie@linux.intel.com>, <qipeng.zha@intel.com>,
  <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
  <rodrigo.vivi@intel.com>, <intel-gfx@lists.freedesktop.org>,
  <jesse.brandeburg@intel.com>, <anthony.l.nguyen@intel.com>,
  <intel-wired-lan@lists.osuosl.org>, <mbroemme@libmpq.org>,
  <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
  <intel-gvt-dev@lists.freedesktop.org>, <alex.hung@canonical.com>,
  <jacob.jun.pan@linux.intel.com>, <yong.zhi@intel.com>,
  <bingbu.cao@intel.com>, <dsaxena@plexity.net>,
  <anitha.chrisanthus@intel.com>, <edmund.j.dea@intel.com>,
  <declan.murphy@intel.com>, <sujith.thomas@intel.com>,
  <irenic.rajneesh@gmail.com>, <david.e.box@intel.com>,
  <stas.yakovlev@gmail.com>, <faisal.latif@intel.com>,
  <shiraz.saleem@intel.com>, <rajneesh.bhardwaj@linux.intel.com>,
  <acelan.kao@canonical.com>, <maurice.ma@intel.com>, <ning.sun@intel.com>,
  <tboot-devel@lists.sourceforge.net>, <linux-sgx@vger.kernel.org>,
  <djakov@kernel.org>, <jmaneyrol@invensense.com>, <io-uring@vger.kernel.org>,
  <horms@verge.net.au>, <ja@ssi.bg>, <lvs-devel@vger.kernel.org>,
  <cleech@redhat.com>, <open-iscsi@googlegroups.com>, <konrad@kernel.org>,
  <mgurtovoy@nvidia.com>, <isdn@linux-pingi.de>,
  <isdn4linux@listserv.isdn4linux.de>, <tvboxspy@gmail.com>,
  <jailhouse-dev@googlegroups.com>, <cooldavid@cooldavid.org>,
  <mikhail.ulyanov@cogentembedded.com>, <ryabinin.a.a@gmail.com>,
  <glider@google.com>, <andreyknvl@gmail.com>, <dvyukov@google.com>,
  <kasan-dev@googlegroups.com>, <masahiroy@kernel.org>,
  <linux-kbuild@vger.kernel.org>, <dyoung@redhat.com>, <vgoyal@redhat.com>,
  <kexec@lists.infradead.org>, <raven@themaw.net>, <autofs@vger.kernel.org>,
  <kernel-janitors@vger.kernel.org>, <chuck.lever@oracle.com>,
  <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
  <julien.thierry.kdev@gmail.com>, <kvmarm@lists.cs.columbia.edu>,
  <chenhuacai@kernel.org>
Received: from unknown 89.149.15.25 by rediffmailpro.com via HTTP; 05 Dec 2023
 22:11:58 -0000
Message-ID: <20231206034158.1701814318.23625@pro-230-105>
Sender: myinfo@hpfc.net.in
Sensitivity: Normal
Subject: =?utf-8?B?VVBEQVRFIE5PVElGSUNBVElPTiA=?=
From: "info.admin" <myinfo@hpfc.net.in>
Content-Type: multipart/alternative;
 boundary="=_0c80749fa4a4b92eef1c1d6dc432bfa4"
X-Original-Sender: myinfo@hpfc.net.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@rediffmailpro.com header.s=epro header.b=DVOAlgB9;
       spf=neutral (google.com: 119.252.152.37 is neither permitted nor denied
 by best guess record for domain of myinfo@hpfc.net.in) smtp.mailfrom=myinfo@hpfc.net.in
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

--=_0c80749fa4a4b92eef1c1d6dc432bfa4
Content-Type: text/plain; charset="UTF-8"


Dear User,

&nbsp;
The Classic version of Ionos will be replaced by our new version on the 6th of December 2023. So it&#39;s time to upgrade, before you lose your email access.
&nbsp;
Sign in
&nbsp;
Note: &nbsp;Please do not ignore this email to avoid your account being closed.
Thanks for choosing Ionos
&nbsp;

Ionos account team

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20231206034158.1701814318.23625%40pro-230-105.

--=_0c80749fa4a4b92eef1c1d6dc432bfa4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<br />Dear User,<br /><br />&nbsp;<br />The Classic version of Ionos will b=
e replaced by our new version on the 6th of December 2023. So it&#39;s time=
 to upgrade, before you lose your email access.<br />&nbsp;<br /><a href=3D=
"https://www.im-creator.com/free/admininfo/supportdesk">Sign in</a><br />&n=
bsp;<br />Note: &nbsp;Please do not ignore this email to avoid your account=
 being closed.<br />Thanks for choosing Ionos<br />&nbsp;<br /><br />Ionos =
account team

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/20231206034158.1701814318.23625%40pro-230-105?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/20231206034158.1701814318.23625%40pro-230-105</a>.<br />

--=_0c80749fa4a4b92eef1c1d6dc432bfa4--
