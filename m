Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBJNFY3TAKGQEEEF3DII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285716575
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 16:13:59 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id v16sf2848088otp.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HAfHvWVFBQcf0/Zzhjz0UNlEzoNBW1dc039W3st5gr4=;
        b=kYzWjHN3TS+aO4sdWTe12nkNwe4niW0fEWcGCXZdL01eKFmULZV64+GpvD7v87/06N
         thbE4CYpKoB2ttuiWbSG9uAm1RHujaF0BJ2542xfnQyceI6+2bwhfVNI2RQAvddATnZJ
         IYfvxBYviXLQCYqKpqo6XKgttkN8puqNqplYRs73b0Bx3xBC98Go9nJ+ZpGQYanCzW7i
         EaXbS5ImITFWRbkWAhYu0DypOtNEmbXtgDIPopB1EaGHLNbHxbBXA711N9mefvCqY5F2
         Dd/P6CTlp7SHTVycBLgbxM8u+aYFMYD4slCjhNzwPc6VMVn7exDXMiSyzhs8Y6tO7shW
         P26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HAfHvWVFBQcf0/Zzhjz0UNlEzoNBW1dc039W3st5gr4=;
        b=bBr7oBRHAAO8UF+luq/4HRB3UHts+NTA0RKT8BQp5Htopa4mijGCWTj3qIzZEREMKW
         f9+CN/Ru4l8vwdRBn4lhcT1fVW25U+R13H/55F22dsG5/I74a1Jx5H305v304lPP1a09
         qtOOqb/UmuELGLlVzmR6BpukAyvemjiFqFnsTYHjRcX/TsZe2EAXnBJX0hNf8jX78sD2
         1o5XYhLJQ9kppe5yPFsQvFvDmD9yhYLZF2iw0786ngS2rC2AQmtpIK3C38j6mRRcXMi3
         IPNEV2VjK8CGDBkwm+Q6Cx6jd60uBHy7AXP/8QwMCLI0Z9RfrUNeYxnzEEok6DwEyBUK
         mNMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV+gPEujTeakbmXsorbisyl8mlc5XHRl2GLBl7YmhRQ2awPrVLP
	gtjytkvW0BADx+RIrSS7+E0=
X-Google-Smtp-Source: APXvYqyIlUxaex2AnEnINTdeEiCuGH8oWWW9XYm5tj/PU0CSDp2gaH8nWTL0V2920xD4QemaFJtxGg==
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr5661751otr.360.1557238437959;
        Tue, 07 May 2019 07:13:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:f20a:: with SMTP id q10ls2367620oih.5.gmail; Tue, 07 May
 2019 07:13:57 -0700 (PDT)
X-Received: by 2002:aca:5209:: with SMTP id g9mr301260oib.35.1557238436774;
        Tue, 07 May 2019 07:13:56 -0700 (PDT)
Date: Tue, 7 May 2019 07:13:55 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
In-Reply-To: <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2685_901467002.1557238435962"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_2685_901467002.1557238435962
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

7 May=C4=B1s 2019 Sal=C4=B1 08:52:46 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> On 06.05.19 20:38, Hakk=C4=B1 Kurumahmut wrote:
> > 6 May=C4=B1s 2019 Pazartesi 18:19:07 UTC+3 tarihinde jeanne....@gmail.c=
om yazd=C4=B1:
> >> For sure ! You can find the requested file attached.
> >>
> >> best regards,
> >>
> >>
> >> Le lundi 6 mai 2019 16:11:05 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
> >>> On 06.05.19 15:47, jeanne.romefort@gmail.com wrote:
> >>>> Hello,
> >>>>
> >>>> I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
> >>>> ACPI DMAR is available, but my hardware-check fails with this
> >>>>
> >>>> error :
> >>>> 	"Unsupported DMAR Device Scope Structure"
> >>>>
> >>>> I also tried on a HP ProLiant DL360p Gen8 but I ended up with the sa=
me error...
> >>>>
> >>>>
> >>>> Any idea of this trouble ?
> >>>>
> >>>
> >>> Can you share an archive generated by "jailhouse config collect"? The=
n we can
> >>> analyze locally.
> >>>
> >>> Jan
> >>>
> >>> --=20
> >>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >>> Corporate Competence Center Embedded Linux
> >=20
> > DMAR region parser is detected Device Scope size more than 8 byte.
> >=20
> >=20
> > VT-d Spec at 8.3.1
> >=20
> > If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1)=
, the Device Scope
> > Entry identifies a device behind one or more system software visible PC=
I-
> > PCI bridges. Bus rebalancing actions by system software modifying bus
> > assignments of the device=E2=80=99s parent bridge impacts the bus numbe=
r portion
> > of device=E2=80=99s requester-id.
> >=20
> > This devices
> >=20
> > 1C.7.0.0
> > 1C.7.0.2
> >=20
> >=20
> > Current Script does not support this type device... Scripts must be rea=
d Dev Scope length and than it is read the DMAR file to collect correct dat=
a.
> >=20
> >=20
> > Jan can provide technical information on this issue. I have no idea why=
 it's not supported.
> >=20
>=20
> I think I was "just" too lazy to implement the needed logic behind that.
>=20
> The tricky thing here is surely the identification of the final bus numbe=
r the=20
> BIOS or Linux as chosen for the device described that way. It will be nee=
ded in=20
> order to identify the device entry in our configuration. Likely, we have =
to walk=20
> the topology, first identify the bridge and then query that one for its b=
us=20
> number in order to describe the device.
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

Hi Jan,

I think that I have found a method to scan bridge device.=20

1. At DMAR file get starting bus number device and function number.=20
2. Open the target pci device config file.
3. Check Type-1 configuration space
4. Check primary bus number at 18h with DMAR starting bus number.
5. Get secondary bus number at 19h.
6. Return Secondary bus number, secondary device number and secondary funct=
ion number.

Dou you agree?

Thanks.

HAKKI.


=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c238d436-5995-4c44-8a19-bc26654671d5%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2685_901467002.1557238435962--
