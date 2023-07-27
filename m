Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBJ7DRCTAMGQEKR43AUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x37.google.com (mail-oa1-x37.google.com [IPv6:2001:4860:4864:20::37])
	by mail.lfdr.de (Postfix) with ESMTPS id CC80C764E5B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jul 2023 10:58:17 +0200 (CEST)
Received: by mail-oa1-x37.google.com with SMTP id 586e51a60fabf-1bb91fb58f2sf1431120fac.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jul 2023 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690448296; x=1691053096;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6VMbyneEw5D+4z03jl79kAAV+kHgAKob65A0NHomNc=;
        b=XjfWdKYC0Xf4loPttz7R2PxdEZ58VuBHyyaYfdLf82hW9MXboaPAmlBHyLsWYgH2aD
         1VaFc12k09AZthcsgd12Hk05dZNqeVfTz+kv03LMnUTtR71kYnU5HE/Yixq8goB6ASjy
         uN7D3nrNo3ocfEBwmr0abrYKj4BKNisXC5HUm0LCRMYGKdiBEpxBCVccKsbkJKtRWhsr
         NknfDYhXQB8RvMdN3u2vPW0cdqNO/NCSHh2JdDyqhv5GKmf0BD1/H4thz8GeO2guYafh
         V+tPYx93gWUY2J9C7axBjux0QHNOnPEIaQZRLBwoALvHEpWeOWu6pkggtwO29RXtX52d
         cpjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690448296; x=1691053096;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6VMbyneEw5D+4z03jl79kAAV+kHgAKob65A0NHomNc=;
        b=BovPPu7VudkN6G7nlk5LUNj3ZX7JCBBUFqaPf1RSxa4jUriXpdrQgXo4E2y1pBqZEi
         NfNEADGpkpvBAkUavhOj6wWmRtpfkkbB30AotYbQIKBkQb1Bus08ooUirvjzR9ZhOk62
         EQxP6MXG5i9it/kjBhAJf+8OGucDnp9uLbBUDBG+oMtB0oc/yB+cZxjvtAM84BfR9Bu+
         Sp5vx/2dsero0Bii3xWFnPliU2V7nocRTRv+4Yi7iVK0ko/AfHEGM2QyIhqFFfya3+jC
         Jp2dRuMSh5jSQBQlc7OO4OJ3ZE4C9q8ORVPeA02h0K9mC2WypI/1mCk0XAc4dS3d5EZh
         UJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448296; x=1691053096;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6VMbyneEw5D+4z03jl79kAAV+kHgAKob65A0NHomNc=;
        b=Pzc9jk4/x55c6Ozfb2+WcVXuYvgipxpdyo1cUaAwz2L8FB5oWHNCBVHohYk+S61PuE
         mfq+d0l30pTSgEaRDOdDG4NzcCuV4j2pTQaG7aGSplmHP+nFyx6wrrhmvRPVMBHft8Yl
         yaZ92Hg5s58A8zB4mB8dKhXbSMk6vA9vCrx6Ceal+d4gfqjsJqvJM1g46+53OsaTOs9X
         0W0GAEwyoh4MiDlaQJTt6TTANahSitVAU3Z4vcnN5w6RtGjRnJOcfvoxfKW0qsse0rLp
         Xw+Vz5nTtoB7bT6wkVwXmmF0yy0cfRpc2zpCztGA42tgOcquiYd4Gr1Q1L2EWORki7Sy
         1K4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLYmMcsWbOTm4hghPFEBtsJ4u24G6X3mnTk30R/aXVJLpG+QxAoe
	b2qZBepbJR9OBVH42Aphd/Y=
X-Google-Smtp-Source: APBJJlGHruXQWgH8mdbsVGJvWu8P2QNmYMhKccUy2Jr+8oaaH7VtMCdHi0AoEBpXLcv13wI0lbNvaQ==
X-Received: by 2002:a05:6871:b0b:b0:1b0:1a03:b345 with SMTP id fq11-20020a0568710b0b00b001b01a03b345mr2763687oab.4.1690448296371;
        Thu, 27 Jul 2023 01:58:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:498e:0:b0:566:c77c:551 with SMTP id z136-20020a4a498e000000b00566c77c0551ls624160ooa.0.-pod-prod-05-us;
 Thu, 27 Jul 2023 01:58:15 -0700 (PDT)
X-Received: by 2002:a9d:6d09:0:b0:6b9:5156:a493 with SMTP id o9-20020a9d6d09000000b006b95156a493mr7066211otp.4.1690448295442;
        Thu, 27 Jul 2023 01:58:15 -0700 (PDT)
Date: Thu, 27 Jul 2023 01:58:14 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <10922b18-30e5-414e-8d85-7e1f33f2f9fan@googlegroups.com>
In-Reply-To: <27f131ff-b744-05fc-0e81-bd2b1267d394@oth-regensburg.de>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
 <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
 <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
 <57a4477a-2c32-49ef-8ccc-e95e1d9fb815n@googlegroups.com>
 <27f131ff-b744-05fc-0e81-bd2b1267d394@oth-regensburg.de>
Subject: Re: Configuration with 2 guest cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1980_1796119616.1690448294692"
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

------=_Part_1980_1796119616.1690448294692
Content-Type: multipart/alternative; 
	boundary="----=_Part_1981_1623023514.1690448294692"

------=_Part_1981_1623023514.1690448294692
Content-Type: text/plain; charset="UTF-8"

Hello Ralf!

Thank you very much for the explanations!

I wonder now that if the hypervisor now has to handle a very large page 
table, the timing behavior of an application in the guest cell will be 
negatively affected.

Could this then be optimized, e.g. using "huge pages"?
Is there a description for this?

Thanks
Jan.

Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 15:48:44 UTC+2:

>
>
> On 26/07/2023 14:41, Jan-Marc Stranz wrote:
> > Thanks for the tip to increase the memory area for the hypervisor!
> > 
> > I have increased the memory area for the hypervisor from 6 MiB to 9 MiB 
> > and can now successfully start both guest cells with a size of 512 MiB 
> each.
> > 
> > I don't know if there is a hint in the documentation for the hypervisor 
> > "Jailhouse" (in the GIT repository).
> > If not, it would certainly be very helpful if this correlation (guest 
> > cell size - required memory for hypervisor) is described somewhere (e.g. 
> > in the file "Documentation/non-root-linux.txt").
>
> Patches welcome! I'd rather recommend to print a proper error message in 
> the hypervisor that gives a pointer to this issue.
>
> Just a short explanation what happened: Jailhouse tries to map huge 
> pages to minimise pressure on TLB. In your case, the area isn't aligned 
> with huge pages, so Jailhouse must map tons of 4k-Pages to cover that 
> memory region. Mapping those pages requires memory for page tables, and 
> apparently, 6MiB weren't sufficient.
>
> Thanks
> Ralf
>
> > 
> > Jan-Marc.
> > 
> > Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 13:12:02 UTC+2:
> > 
> > 
> > 
> > On 26/07/2023 12:56, Jan-Marc Stranz wrote:
> > > Of course, I checked the configuration for the root cell with
> > "jailhouse
> > > config check".
> > > However, this is not changed at all while I change the
> > configuration for
> > > the guest cells.
> > >
> > > Also, everything is fine as long as I don't set the size for the
> > guest
> > > cell larger than 320 MiB in the guest cell configuration.
> > > This only uses about 62% of the memory area reserved for the
> > guest cells
> > > in the configuration for the root cell.
> > >
> > > I will follow up on the tip to increase the memory area for the
> > > hypervisor ( hypervisor_memory.size).
> > > So far, 6 MiB is reserved for the hypervisor itself.
> > > To what size should I increase this memory area?
> > 
> > Just a bit more. Try 10 MiB or so.
> > 
> > Ralf
> > 
> > >
> > > However, to find the cause in the driver or hypervisor, I lack the
> > > necessary knowledge about the structure and relationships.
> > > So I have to rely on external help.
> > >
> > > Thanks a lot!
> > > Jan-Marc.
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com 
> <
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com> 
> <
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_medium=email&utm_source=footer 
> <
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_medium=email&utm_source=footer
> >>.
> > 
> > -- 
> > You received this message because you are subscribed to the Google 
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send 
> > an email to jailhouse-de...@googlegroups.com 
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit 
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com 
> <
> https://groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com?utm_medium=email&utm_source=footer
> >.
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/10922b18-30e5-414e-8d85-7e1f33f2f9fan%40googlegroups.com.

------=_Part_1981_1623023514.1690448294692
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ralf!<br /><br />Thank you very much for the explanations!<br /><br /=
>I wonder now that if the hypervisor now has to handle a very large page ta=
ble, the timing behavior of an application in the guest cell will be negati=
vely affected.<br /><br />Could this then be optimized, e.g. using "huge pa=
ges"?<br />Is there a description for this?<br /><br />Thanks<br />Jan.<br =
/><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">R=
alf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 15:48:44 UTC+2:<br/></di=
v><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 26/07/2023 14:41, Jan-Marc Stranz wrote:
<br>&gt; Thanks for the tip to increase the memory area for the hypervisor!
<br>&gt;=20
<br>&gt; I have increased the memory area for the hypervisor from 6 MiB to =
9 MiB=20
<br>&gt; and can now successfully start both guest cells with a size of 512=
 MiB each.
<br>&gt;=20
<br>&gt; I don&#39;t know if there is a hint in the documentation for the h=
ypervisor=20
<br>&gt; &quot;Jailhouse&quot; (in the GIT repository).
<br>&gt; If not, it would certainly be very helpful if this correlation (gu=
est=20
<br>&gt; cell size - required memory for hypervisor) is described somewhere=
 (e.g.=20
<br>&gt; in the file &quot;Documentation/non-root-linux.txt&quot;).
<br>
<br>Patches welcome! I&#39;d rather recommend to print a proper error messa=
ge in=20
<br>the hypervisor that gives a pointer to this issue.
<br>
<br>Just a short explanation what happened: Jailhouse tries to map huge=20
<br>pages to minimise pressure on TLB. In your case, the area isn&#39;t ali=
gned=20
<br>with huge pages, so Jailhouse must map tons of 4k-Pages to cover that=
=20
<br>memory region. Mapping those pages requires memory for page tables, and=
=20
<br>apparently, 6MiB weren&#39;t sufficient.
<br>
<br>Thanks
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Jan-Marc.
<br>&gt;=20
<br>&gt; Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 13:12:02 UTC+2=
:
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;     On 26/07/2023 12:56, Jan-Marc Stranz wrote:
<br>&gt;      &gt; Of course, I checked the configuration for the root cell=
 with
<br>&gt;     &quot;jailhouse
<br>&gt;      &gt; config check&quot;.
<br>&gt;      &gt; However, this is not changed at all while I change the
<br>&gt;     configuration for
<br>&gt;      &gt; the guest cells.
<br>&gt;      &gt;
<br>&gt;      &gt; Also, everything is fine as long as I don&#39;t set the =
size for the
<br>&gt;     guest
<br>&gt;      &gt; cell larger than 320 MiB in the guest cell configuration=
.
<br>&gt;      &gt; This only uses about 62% of the memory area reserved for=
 the
<br>&gt;     guest cells
<br>&gt;      &gt; in the configuration for the root cell.
<br>&gt;      &gt;
<br>&gt;      &gt; I will follow up on the tip to increase the memory area =
for the
<br>&gt;      &gt; hypervisor ( hypervisor_memory.size).
<br>&gt;      &gt; So far, 6 MiB is reserved for the hypervisor itself.
<br>&gt;      &gt; To what size should I increase this memory area?
<br>&gt;=20
<br>&gt;     Just a bit more. Try 10 MiB or so.
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; However, to find the cause in the driver or hypervisor, =
I lack the
<br>&gt;      &gt; necessary knowledge about the structure and relationship=
s.
<br>&gt;      &gt; So I have to rely on external help.
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks a lot!
<br>&gt;      &gt; Jan-Marc.
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/43f=
41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a=
618-1955e237cc87n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1690534=
315498000&amp;usg=3DAOvVaw2lMnTMIkqxAgtcgEmWeCBe">https://groups.google.com=
/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/43f=
41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a=
618-1955e237cc87n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1690534=
315498000&amp;usg=3DAOvVaw2lMnTMIkqxAgtcgEmWeCBe">https://groups.google.com=
/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1690534315498000&amp;usg=3DAOvVaw2abhhBzl8EzeZ7UCKJPci7">https://grou=
ps.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a61=
8-1955e237cc87n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/43f41f9d-0930-416b-a618-1955e237cc87n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1690534315498000&=
amp;usg=3DAOvVaw2abhhBzl8EzeZ7UCKJPci7">https://groups.google.com/d/msgid/j=
ailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/57a4477=
a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-=
e95e1d9fb815n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16905343154=
98000&amp;usg=3DAOvVaw0ZlRYPed0XWjUN_DOT7MOH">https://groups.google.com/d/m=
sgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/57a4477=
a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
690534315498000&amp;usg=3DAOvVaw0-iUDDhCNcFeVE8Ig9YlE3">https://groups.goog=
le.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/10922b18-30e5-414e-8d85-7e1f33f2f9fan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/10922b18-30e5-414e-8d85-7e1f33f2f9fan%40googlegroups.co=
m</a>.<br />

------=_Part_1981_1623023514.1690448294692--

------=_Part_1980_1796119616.1690448294692--
