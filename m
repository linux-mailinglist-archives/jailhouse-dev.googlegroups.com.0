Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBKET6WJQMGQEA2GGRSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id B494D525432
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 19:53:45 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id d8-20020a05622a05c800b002f3bb450e94sf4425027qtb.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rlorqi1wbNVjngznWl0Jn/Wq83wbaHU9eOYB4XvjER8=;
        b=c8t6joJLe+hpQdolNEyi7I0Dg92m3rx8Yrb/fNU/5NXPITAEMCz/HJxsHxTgLJVuoS
         1buxH+GmnTNP3+QkgUtZMzDiih46C1KZ/d42K/61xI5nZZDpn3j9P/aM/gotsBf+9/FF
         YExYZhIPOCIcXGd4mCNFSXCsG8fri9dlcnYGYyvSuCWwum8RxGWI7IIv6dGVTfXZg3YV
         In3/ueSR9kNDHo20SRsaawB3jrxyMMKT7uaRRW4tRoTiConnKucA1J/ixXTnH5loPvYW
         HcHUucq6CYzUzBNHBQ6OlpiLeIQRLHwOaW52O/Pc2HrIPEkO8zLc0zD9IbkgLFnkb28m
         FQmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rlorqi1wbNVjngznWl0Jn/Wq83wbaHU9eOYB4XvjER8=;
        b=O6id/6latHgmEPjHE0x2/MECRqD9gjXzTqRxdtSybWeDs511SgTmPufg7u1quJy3fv
         RGvb43ZdgO4Wishk/xazZISYEV9cOpKHZkhMN3mlGkXJajHUY2UkOkpURKp7Wcj169CU
         L5t83FDr6nfbcqSRNNUMXzgOZUlmSjUB/mNM0j+yhhfoA6WfGMJhxCijihiT2XomnSiE
         DP+GvbXEX8zY2/vome6TUgELuWNEUA6uKrIPq1DS3b2lMUXBlbL9CFgZwipZWJ6RdH/5
         Q/XfjpwWAUyoTHujx1HUyE6MyXvRtJYh75D2QC4nxfqApErshN2kN9wSjaxHQmJesDph
         ydSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rlorqi1wbNVjngznWl0Jn/Wq83wbaHU9eOYB4XvjER8=;
        b=uPtojDq/672HGiP5iOOVK2xXHKp8AENbPoh9k/4s0OkQslDYgnmFtbvY+Pp9nCbYZ0
         RWV6SErBxxUTy+BrORwaHA4UhPyNG+oWF3onwjHKtKv9YhaKc79U585J3/wSEqWBll3i
         zlYrujb6CyGo4kl6uPeVNF4VvhWoV4aPf2Yl0mkXWiVphoLHCTgm51AI0IzIkMpCiFg/
         m9/gqJ+TF8zAuXwvEibKzIMlPByE25Y7hBdUqLvwLHBLsgC4+nWOqnoixRscluZrAWwG
         FwkN9ndDYquFCzodrPyxJYGvKmzc8aZolWpcUjNUKBNvcrSOs/7SgqGbeN6ZMrhJ0SVc
         N4Wg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531cqAAhS8GxD+zKCWsAMSs2iHbLTEvhZ38sfwiYH40z1gt6YWFu
	wPcGN1NRXtvOyayie3ODn0I=
X-Google-Smtp-Source: ABdhPJzPZSp/2vkgzLuKINObnS6nwbywOAfOfImH+S/0YdpuPG5XQ1G5X7l/UJrqKSdO6bUjJAfW7Q==
X-Received: by 2002:a05:622a:296:b0:2f3:b7e6:f205 with SMTP id z22-20020a05622a029600b002f3b7e6f205mr921663qtw.613.1652378024379;
        Thu, 12 May 2022 10:53:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:690d:0:b0:2f3:c611:5ca1 with SMTP id bt13-20020ac8690d000000b002f3c6115ca1ls3822053qtb.4.gmail;
 Thu, 12 May 2022 10:53:43 -0700 (PDT)
X-Received: by 2002:ac8:5f85:0:b0:2f3:c5c8:8cb0 with SMTP id j5-20020ac85f85000000b002f3c5c88cb0mr982324qta.408.1652378023592;
        Thu, 12 May 2022 10:53:43 -0700 (PDT)
Date: Thu, 12 May 2022 10:53:43 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1e5e8b21-961e-4772-8ea5-57f178cbf389n@googlegroups.com>
In-Reply-To: <51ac167a-59b6-448a-b6db-e109ab528009n@googlegroups.com>
References: <ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n@googlegroups.com>
 <e4196998-4979-c4f8-bc45-52f0499a8033@siemens.com>
 <51ac167a-59b6-448a-b6db-e109ab528009n@googlegroups.com>
Subject: Re: Jailhouse 0.12 on i.MX8MQ EVK
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2956_1068185447.1652378023020"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_2956_1068185447.1652378023020
Content-Type: multipart/alternative; 
	boundary="----=_Part_2957_985565388.1652378023020"

------=_Part_2957_985565388.1652378023020
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks!

Any input on this issue?

Vipul
On Wednesday, May 11, 2022 at 8:56:47 PM UTC+5:30 vsun...@gmail.com wrote:

> Hi,
>
> I am using AGL lamprey source & building for i.MX8MQ.
>
> Thanks & Regards,
> Vipul Kumar
>
> On Wednesday, May 11, 2022 at 8:39:41 PM UTC+5:30 j.kiszka...@gmail.com 
> wrote:
>
>> On 11.05.22 09:16, vsun...@gmail.com wrote: 
>> > Hi All, 
>> > 
>> > I am building jailhouse 0.12 on kernel 5.4.147 i.MX8, but its failing 
>> > with below logs. I could successfully build jailhouse 0.11 on the same 
>> > kernel. Any suggestions on this, does 0.12 version support i.MX8? 
>> > 
>> >  /*vipulkumar@A812DBLR:~/platform/AGL_lamprey/build$ bitbake -k 
>> > agl-demo-platform*/ 
>> > 
>>
>> Are you using an AGL-provided integration here? 
>>
>> Anyway, maybe Peng can provide guidance here. 
>>
>> Jan 
>>
>> -- 
>> Siemens AG, Technology 
>> Competence Center Embedded Linux 
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1e5e8b21-961e-4772-8ea5-57f178cbf389n%40googlegroups.com.

------=_Part_2957_985565388.1652378023020
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Thanks!</div><div><br></div><div>Any input on this i=
ssue?<br><br></div><div>Vipul</div><div class=3D"gmail_quote"><div dir=3D"a=
uto" class=3D"gmail_attr">On Wednesday, May 11, 2022 at 8:56:47 PM UTC+5:30=
 vsun...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">Hi,<div><br></div><div>I am using AGL lamprey source &amp; bui=
lding for i.MX8MQ.</div><div><br></div><div>Thanks &amp; Regards,</div><div=
>Vipul Kumar<br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" clas=
s=3D"gmail_attr">On Wednesday, May 11, 2022 at 8:39:41 PM UTC+5:30 <a href =
data-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</a> wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 11.05.22 09:16, <a rel=3D"=
nofollow">vsun...@gmail.com</a> wrote:
<br>&gt; Hi All,
<br>&gt;=20
<br>&gt; I am building jailhouse 0.12 on kernel 5.4.147 i.MX8, but its fail=
ing
<br>&gt; with below logs. I could successfully build jailhouse 0.11 on the =
same
<br>&gt; kernel. Any suggestions on this, does 0.12 version support i.MX8?
<br>&gt;=20
<br>&gt; =C2=A0/*vipulkumar@A812DBLR:~/platform/AGL_lamprey/build$ bitbake =
-k
<br>&gt; agl-demo-platform*/
<br>&gt;=20
<br>
<br>Are you using an AGL-provided integration here?
<br>
<br>Anyway, maybe Peng can provide guidance here.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1e5e8b21-961e-4772-8ea5-57f178cbf389n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1e5e8b21-961e-4772-8ea5-57f178cbf389n%40googlegroups.co=
m</a>.<br />

------=_Part_2957_985565388.1652378023020--

------=_Part_2956_1068185447.1652378023020--
